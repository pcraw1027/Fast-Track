class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit ]

  # GET /products or /products.json
  def index
    @products = Product.all
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
  end

  # POST /products or /products.json
  def create
    variant_exist = ProductVariant.find_by(barcode: product_variant_params[:barcode])
    if variant_exist
        respond_to do |format|
            format.html { redirect_to new_product_path, notice: "Product variant already exist.", status: :unprocessable_entity }
            format.json { render json: {errors: [{barcode:"variant already exisr"}]}, status: :unprocessable_entity }
        end
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
      @families = Family.all
      @klasses = Klass.all
      @bricks = Brick.all
      @product_category_sources = ProductCategorySource.all
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
