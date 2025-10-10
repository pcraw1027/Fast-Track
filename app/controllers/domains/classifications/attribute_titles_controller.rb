class Domains::Classifications::AttributeTitlesController < ApplicationController
  before_action :set_attribute_title, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit create ]


  # GET /attribute_titles or /attribute_titles.json
  def index
    @attribute_titles = Domains::Classifications::AttributeTitle.all
  end

  # GET /attribute_titles/1 or /attribute_titles/1.json
  def show
  end

  # GET /attribute_titles/new
  def new
    @attribute_title = Domains::Classifications::AttributeTitle.new
  end

  # GET /attribute_titles/1/edit
  def edit
  end

  # POST /attribute_titles or /attribute_titles.json
  def create
    @attribute_title = Domains::Classifications::AttributeTitle.new(attribute_title_params)

    respond_to do |format|
      if @attribute_title.save
        format.html { redirect_to @attribute_title, notice: "Attribute title was successfully created." }
        format.json { render :show, status: :created, location: @attribute_title }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attribute_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attribute_titles/1 or /attribute_titles/1.json
  def update
    respond_to do |format|
      if @attribute_title.update(attribute_title_params)
        format.html { redirect_to @attribute_title, notice: "Attribute title was successfully updated." }
        format.json { render :show, status: :ok, location: @attribute_title }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attribute_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attribute_titles/1 or /attribute_titles/1.json
  def destroy
    @attribute_title.destroy

    respond_to do |format|
      format.html do
 redirect_to domains_classifications_attribute_titles_path, status: :see_other, notice: "Attribute title was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attribute_title
      @attribute_title = Domains::Classifications::AttributeTitle.find(params[:id])
    end

    def set_dropdowns
      @product_category_sources = Domains::Classifications::ProductCategorySource.all
    end

    # Only allow a list of trusted parameters through.
    def attribute_title_params
      params.require(:domains_classifications_attribute_title).permit(:code, :title, :description, :product_category_source_id)
    end
end
