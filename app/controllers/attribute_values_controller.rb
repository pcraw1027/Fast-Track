class AttributeValuesController < ApplicationController
  before_action :set_attribute_value, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit create ]


  # GET /attribute_values or /attribute_values.json
  def index
    @attribute_values = AttributeValue.all
  end

  # GET /attribute_values/1 or /attribute_values/1.json
  def show
  end

  # GET /attribute_values/new
  def new
    @attribute_value = AttributeValue.new
  end

  # GET /attribute_values/1/edit
  def edit
  end

  # POST /attribute_values or /attribute_values.json
  def create
    @attribute_value = AttributeValue.new(attribute_value_params)

    respond_to do |format|
      if @attribute_value.save
        format.html { redirect_to @attribute_value, notice: "Attribute value was successfully created." }
        format.json { render :show, status: :created, location: @attribute_value }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attribute_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attribute_values/1 or /attribute_values/1.json
  def update
    respond_to do |format|
      if @attribute_value.update(attribute_value_params)
        format.html { redirect_to @attribute_value, notice: "Attribute value was successfully updated." }
        format.json { render :show, status: :ok, location: @attribute_value }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attribute_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attribute_values/1 or /attribute_values/1.json
  def destroy
    @attribute_value.destroy

    respond_to do |format|
      format.html do
 redirect_to attribute_values_path, status: :see_other, notice: "Attribute value was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attribute_value
      @attribute_value = AttributeValue.find(params[:id])
    end

    def set_dropdowns
      @product_category_sources = ProductCategorySource.all
    end

    # Only allow a list of trusted parameters through.
    def attribute_value_params
      params.require(:attribute_value).permit(:code, :title, :description, :product_category_source_id)
    end
end
