class Domains::Products::ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]
  before_action :set_dropdowns, only: %i[ new edit ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy update_to_level_one update_to_level_two]

  # GET /products or /products.json
  def index
    @products = if params[:q].present?
                Domains::Products::Product.includes(:company, :segment, :family, :klass, :brick, product_variants: :media)
                                          .where("name ILIKE ?", "%#{params[:q]}%")
                                          .paginate(page: params[:page], per_page: 15)
                                          .order(updated_at: :desc, id: :desc)
                else
                Domains::Products::Product.includes(:company, :segment, :family, :klass, :brick, :product_variants, product_variants: :media)
                                          .all
                                          .paginate(page: params[:page], per_page: 15)
                                          .order(updated_at: :desc, id: :desc)
                end
     
  end

  
  def update_to_level_one
    error = ""
    error += "product name is required, " if product_params[:name].blank?
    error += "description is required" if product_params[:description].blank?

    barcode = product_variant_params[:barcode]&.strip
    company_name = params[:domains_products_product][:new_company_name]

    if error.present?
      respond_to_invalid_entries(error, product_capture_interface_path(barcode: barcode))
      return
    end

    serialized_params = product_params.dup
    company_id = nil
    mid = Domains::CroupierCore::Operations::MidExtractor.call!(barcode: barcode).payload

    company = nil
    cit_rec = Domains::CroupierCore::CitRecord.find_by(mid: mid)

    if product_params[:company_id]&.to_s&.match?(/^\d+$/)
      company = Domains::Companies::Company.find_by(id: product_params[:company_id])
      unless company
        respond_to_invalid_entries("Company not found", product_capture_interface_path(barcode: barcode))
        return
      end
      company_id = company.id
      if cit_rec
        Domains::CroupierCore::CitRecord.normalize_cit_rec(cit_rec, company_id)
      else
        Domains::CroupierCore::CitRecord.resolve_cit_rec(mid, company.id, current_user.id)
      end
    else
      begin
        company_id = Domains::Companies::Company.spawn_new_instance(cit_rec, company_name, current_user.id)
        serialized_params[:company_id] = company_id
      rescue StandardError => e
        redirect_to(product_capture_interface_path(barcode: barcode), alert: e.message)
        return
      end
    end

    pit_record = Domains::CroupierCore::PitRecord.find_by(barcode: barcode)
    variant_exist = Domains::Products::ProductVariant.includes(:product).find_by(barcode: barcode)

    if variant_exist
      @product = variant_exist.product
      variant_exist.update(product_variant_params) if product_variant_params.present?
      if @product.update(serialized_params)
        upgrade_pit_to_level_1(@product.id, pit_record&.level, company_id)
        redirect_to(product_capture_interface_path(barcode: barcode, level: params[:level]), 
        notice: "Product was successfully updated.")
        return
      end
    else
      @product = Domains::Products::Product.new(serialized_params)
    end

    respond_to do |format|
      if @product.save
        pv = Domains::Products::ProductVariant.new(product_variant_params)
        pv.barcode = pv.barcode.strip
        pv.product_id = @product.id
        pv.save!
        upgrade_pit_to_level_1(@product.id, pit_record&.level, company_id)
        Domains::CroupierCore::Scan.resolve(barcode, @product.id)
        Domains::Users::ListRoutine.resolve_resource(
          resource_id: @product.id, resource_type: "Domains::Products::Product", barcode: barcode
          )

          
        Domains::CroupierCore::UploadRecord.resolve(barcode)
        format.html do
 redirect_to product_capture_interface_path(barcode: barcode, level: params[:level]), 
notice: "Product successfully added"
        end
        format.json { render :show, status: :created, location: @product }
      else
        error = @product.errors.map { |er| "#{er.attribute} #{er.message}" }.join(", ")
        format.html do
 redirect_to product_capture_interface_path(barcode: barcode, level: params[:level]), alert: error
        end
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def update_to_level_two
    @product = Domains::Products::Product.find(params[:product_id])
    barcode = product_variant_params[:barcode]&.strip
    respond_to do |format|
      if @product.update!(product_params)
        Domains::CroupierCore::PitRecord.find_by(barcode: barcode)
        Domains::CroupierCore::Operations::UpgradePitLevel.call!(barcode: barcode, 
        product_id: @product.id, asin: nil, user_id: current_user.id, level: 2) 
        format.html do
 redirect_to product_capture_interface_path(barcode: barcode, level: params[:level]), 
notice: "Product was successfully updated."
        end
        format.json { render :show, status: :ok, location: @product }
      else
        error = @product.errors.map { |er| "#{er.attribute} #{er.message}" }.join(", ")
            format.html do
 redirect_to product_capture_interface_path(barcode: barcode, level: params[:level]), alert: error
            end
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /products/1 or /products/1.json
  def show
    @variants = Domains::Products::ProductVariant.by_product(@product.id)
  end

  # GET /products/new
  def new
    @product = Domains::Products::Product.new
    product_variant = Domains::Products::ProductVariant.new
    product_variant.media.build
    @product.media = product_variant.media
  end

  # GET /products/1/edit
  def edit
    variant = Domains::Products::ProductVariant.find_by(product_id: params[:id])
    if variant
        redirect_to(product_capture_interface_path(barcode: variant.barcode, level: 0))
    else
      redirect_to(domains_products_products_path, alert: "product has no variant! Simply delete this product and create a new one")
    end
    # @company = Company.find(@product.company_id) if @product.company_id
    # @segment = Segment.find(@product.segment_id) if @product.segment_id
    # @family = Family.find(@product.family_id) if @product.family_id
    # @klass = Klass.find(@product.klass_id) if @product.klass_id
    # @brick = Brick.find(@product.brick_id) if @product.brick_id
  end

  # POST /products or /products.json
  def create
    if product_variant_params[:barcode].strip.length < 12
      respond_to_invalid_entries("minimum barcode length is 12")  
    else
        variant_exist = Domains::Products::ProductVariant.find_by(barcode: product_variant_params[:barcode].strip)
        if variant_exist
            respond_to_invalid_entries("Product variant already exist.")
        else
            @product = Domains::Products::Product.new(product_params)
            respond_to do |format|
              if @product.save
                pv = Domains::Products::ProductVariant.new(product_variant_params)
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
      format.html { redirect_to domains_products_products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Domains::Products::Product.find(params[:id])
    end

    def set_dropdowns
      @product_category_sources = Domains::Classifications::ProductCategorySource.all
      product_category_source_id = @product_category_sources&.find { |p| p.code == 'AMZ' }&.id 
      @segments = Domains::Classifications::Segment.where(product_category_source_id: product_category_source_id)
    end

    def upgrade_pit_to_level_1(product_id, pit_level, company_id)
      return unless pit_level.zero?

            Domains::CroupierCore::Operations::UpgradePitLevel.call!(barcode: product_variant_params[:barcode].strip, 
                              product_id: product_id, 
                              asin: params[:domains_products_product][:asin],
                              user_id: current_user.id, company_id: company_id, level: 1)    
      
    end

    def respond_to_invalid_entries(msg, path = new_product_path)
      respond_to do |format|
        format.html { redirect_to path, alert: msg }
        format.json { render json: { errors: [{ barcode: msg }] }, status: :unprocessable_entity }
      end
    end
    
    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:domains_products_product).permit(:company_id, :name, :product_category_source_id, :description, 
      :qrcode, :size, :segment_id,  :family_id, :klass_id, :brick_id)
    end
    
    def product_variant_params
      params.require(:domains_products_product).permit(:barcode, media_attributes: [:id, :file, :_destroy])
    end

end
