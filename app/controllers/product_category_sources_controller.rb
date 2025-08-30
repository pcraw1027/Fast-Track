class ProductCategorySourcesController < ApplicationController
  before_action :set_product_category_source, only: %i[ show edit update destroy ]

  # GET /product_category_sources or /product_category_sources.json
  def index
    @product_category_sources = ProductCategorySource.all
  end

  # GET /product_category_sources/1 or /product_category_sources/1.json
  def show
  end

  # GET /product_category_sources/new
  def new
    @product_category_source = ProductCategorySource.new
    
  end

  # GET /product_category_sources/1/edit
  def edit
  end

  # POST /product_category_sources or /product_category_sources.json
  def create
    @product_category_source = ProductCategorySource.new(product_category_source_params)

    respond_to do |format|
      if @product_category_source.save
        format.html do
 redirect_to @product_category_source, notice: "Product category source was successfully created."
        end
        format.json { render :show, status: :created, location: @product_category_source }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_category_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_category_sources/1 or /product_category_sources/1.json
  def update
    respond_to do |format|
      if @product_category_source.update(product_category_source_params)
        format.html do
 redirect_to @product_category_source, notice: "Product category source was successfully updated."
        end
        format.json { render :show, status: :ok, location: @product_category_source }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_category_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_category_sources/1 or /product_category_sources/1.json
  def destroy
    @product_category_source.destroy

    respond_to do |format|
      format.html do
 redirect_to product_category_sources_path, status: :see_other, 
notice: "Product category source was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_category_source
      @product_category_source = ProductCategorySource.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_category_source_params
      params.require(:product_category_source).permit(:code, :description)
    end
end
