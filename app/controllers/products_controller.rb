class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy insert_product update_to_level_two]


  # GET /products or /products.json
  def index
    @products = Product.all
  end

  def insert_product
    error = ""
    #error += "company is required, " if product_params[:company_id].blank?
    error += "product name is required, " if product_params[:name].blank?
    error += "description is required" if product_params[:description].blank?

    company_name = params[:product][:new_company_name]

    
    if error.length > 0
      respond_to_invalid_entries(error, pit_record_product_capture_interface_path(pit_record_id: params[:product][:pit_record_id]))  
    else
      
      unless product_params[:company_id].blank?
        company = Company.find(product_params[:company_id])
        company_name = company.name
      end

        @product = Product.new(product_params)
        respond_to do |format|
          if @product.save

            variant_exist = ProductVariant.find_by(barcode: product_variant_params[:barcode])
            if variant_exist && !product_variant_params[:image].blank?
                variant_exist.update(image: product_variant_params[:image])
            elsif !variant_exist
              ProductVariant.create!(
                      barcode: product_variant_params[:barcode],
                      image: product_variant_params[:image],
                      product_id: @product.id
                    )
            end

            CroupierCore::UpgradePitLevel.call!(barcode: product_variant_params[:barcode], 
                              product_id: @product.id, company_name: company_name, asin: params[:product][:asin],
                              user_id: current_user.id)
            format.html { redirect_to @product, notice: "Product successfully added" }
            format.json { render :show, status: :created, location: @product }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @product.errors, status: :unprocessable_entity }
          end
        end
        
    end
  end


  def update_to_level_two
    @product = Product.find(params[:product_id])
    respond_to do |format|
      if @product.update(product_params)
        CroupierCore::UpgradePitLevel.call!(barcode: product_variant_params[:barcode], 
        product_id: @product.id, company_name: nil, asin: nil, user_id: current_user.id)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /products/1 or /products/1.json
  def show
    @variants = @product.product_variants
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @company = Company.find(@product.company_id)
    @segment = Segment.find(@product.segment_id)
    @family = Family.find(@product.family_id)
    @klass = Klass.find(@product.klass_id)
    @brick = Brick.find(@product.brick_id)

    @families = Family.all
    @klasses = Klass.all
    @bricks = Brick.all
  end

  # POST /products or /products.json
  def create
    if product_variant_params[:barcode].length < 12
      respond_to_invalid_entries("minimum barcode length is 12")  
    else
        variant_exist = ProductVariant.find_by(barcode: product_variant_params[:barcode])
        if variant_exist
            respond_to_invalid_entries("Product variant already exist.")
        else
            @product = Product.new(product_params)
            respond_to do |format|
              if @product.save
                ProductVariant.create!(
                  barcode: product_variant_params[:barcode],
                  image: product_variant_params[:image],
                  product_id: @product.id
                )
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
      @segments = Segment.all
      @product_category_sources = ProductCategorySource.all
    end

    def respond_to_invalid_entries(msg, path=new_product_path)
      respond_to do |format|
        format.html { redirect_to path, notice: msg, status: :unprocessable_entity }
        format.json { render json: {errors: [{barcode: msg}]}, status: :unprocessable_entity }
      end
    end
    
    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:company_id, :name, :product_category_source_id, :description, 
      :qrcode, :size, :segment_id, :family_id, :klass_id, :brick_id)
    end
    def product_variant_params
      params.require(:product).permit(:barcode, :image)
    end
end
