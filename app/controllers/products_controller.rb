class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy insert_product update_to_level_two]

  # GET /products or /products.json
  def index
    @products = Product.includes(:company, :segment, :family, :klass, :brick).all
  end

  def insert_product
    error = ""
    #error += "company is required, " if product_params[:company_id].blank?
    error += "product name is required, " if product_params[:name].blank?
    error += "description is required" if product_params[:description].blank?

    company_name = params[:product][:new_company_name]
    
    if error.length > 0
      respond_to_invalid_entries(error, product_capture_interface_path(barcode: product_variant_params[:barcode]))  
    else

      serialized_params = product_params
      
      if product_params[:company_id]&.to_s.match?(/^\d+$/)
        company = Company.find(product_params[:company_id])
        company_name = company.name
      elsif 
        serialized_params = product_params.except(:company_id)
      end
      
      @product = Product.new(serialized_params)
      pit_record = PitRecord.find_by(barcode: product_variant_params[:barcode].strip)
      variant_exist = ProductVariant.find_by(barcode: product_variant_params[:barcode].strip)
      if variant_exist
        @product = variant_exist.product
        variant_exist.update(product_variant_params) unless product_variant_params.blank?
        if @product.update(serialized_params)
          upgrade_pit_to_level_1_or_update_cit(@product.id, pit_record.level, company_name)
          redirect_to product_capture_interface_path(barcode: product_variant_params[:barcode].strip), notice: "Product was successfully updated." and return
        end
      end
        
        respond_to do |format|
          if @product.save
              pv = ProductVariant.new(product_variant_params)
              pv.barcode = pv.barcode.strip
              pv.product_id = @product.id
              pv.save!
              upgrade_pit_to_level_1_or_update_cit(@product.id, pit_record.level, company_name)
            format.html { redirect_to product_capture_interface_path(barcode: product_variant_params[:barcode].strip), notice: "Product successfully added" }
            format.json { render :show, status: :created, location: @product }
          else
            error = @product.errors.map{|k,v| "#{k.to_s} #{v}"}.join(", ")
            format.html { redirect_to product_capture_interface_path(barcode: product_variant_params[:barcode].strip), alert: error, status: :unprocessable_entity }
            format.json { render json: @product.errors, status: :unprocessable_entity }
          end
        end
        
    end
  end


  def update_to_level_two
    @product = Product.find(params[:product_id])
    respond_to do |format|
      if @product.update(product_params)
        pit_record = PitRecord.find_by(barcode: product_variant_params[:barcode].strip)
        CroupierCore::UpgradePitLevel.call!(barcode: product_variant_params[:barcode].strip, 
        product_id: @product.id, company_name: nil, asin: nil, user_id: current_user.id) if pit_record == 1
        format.html { redirect_to product_capture_interface_path(barcode: product_variant_params[:barcode].strip), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        error = @product.errors.map{|k,v| v}.join(", ")
            format.html { redirect_to product_capture_interface_path(barcode: product_variant_params[:barcode].strip), alert: error, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /products/1 or /products/1.json
  def show
    @variants = @product.product_variants.includes(:media)
  end

  # GET /products/new
  def new
    @product = Product.new
    product_variant = ProductVariant.new
    product_variant.media.build
    @product.media = product_variant.media
  end

  # GET /products/1/edit
  def edit
    @company = Company.find(@product.company_id) if @product.company_id
    @segment = Segment.find(@product.segment_id) if @product.segment_id
    @family = Family.find(@product.family_id) if @product.family_id
    @klass = Klass.find(@product.klass_id) if @product.klass_id
    @brick = Brick.find(@product.brick_id) if @product.brick_id

  end

  # POST /products or /products.json
  def create
    if product_variant_params[:barcode].strip.length < 12
      respond_to_invalid_entries("minimum barcode length is 12")  
    else
        variant_exist = ProductVariant.find_by(barcode: product_variant_params[:barcode].strip)
        if variant_exist
            respond_to_invalid_entries("Product variant already exist.")
        else
            @product = Product.new(product_params)
            respond_to do |format|
              if @product.save
                pv = ProductVariant.new(product_variant_params)
                pv.barcode = pv.barcode.strip
                pv.product_id = @product.id
                pv.save!
                format.html { redirect_to @product, notice: "Product successfully created" }
                format.json { render :show, status: :created, location: @product }
              else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @product.errors, status: :unprocessable_entity }
              end
            end
        end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_dropdowns
      @product_category_sources = ProductCategorySource.all
      product_category_source_id = @product_category_sources&.find{|p| p.code == 'AMZ'}&.id 
      @segments = Segment.where(product_category_source_id: product_category_source_id)
    end

    def upgrade_pit_to_level_1_or_update_cit(product_id, pit_level, company_name)
      if pit_level == 0
            CroupierCore::UpgradePitLevel.call!(barcode: product_variant_params[:barcode].strip, 
                              product_id: product_id, company_name: company_name, asin: params[:product][:asin],
                              user_id: current_user.id) 
         elsif
              unless product_params[:company_id].blank?
                mid = CroupierCore::MidExtractor.call!(barcode: product_variant_params[:barcode].strip).payload
                cit_rec = CitRecord.find_by(mid: mid)
                cit_rec.update(company_name: company_name) if cit_rec.company_name != company_name
              end
          end
    end

    def respond_to_invalid_entries(msg, path=new_product_path)
      respond_to do |format|
        format.html { redirect_to path, alert: msg, status: :unprocessable_entity }
        format.json { render json: {errors: [{barcode: msg}]}, status: :unprocessable_entity }
      end
    end
    
    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:company_id, :name, :product_category_source_id, :description, 
      :qrcode, :size, :segment_id, :captured_product_category, :family_id, :klass_id, :brick_id)
    end
    
    def product_variant_params
      params.require(:product).permit(:barcode, media_attributes: [:id, :file, :_destroy])
    end

end
