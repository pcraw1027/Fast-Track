class FamiliesController < ApplicationController
  before_action :set_family, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit create ]

  # GET /families or /families.json
  def index
    if params[:product_category_source_id]
      product_category_source_id = ProductCategorySource.find_by(code: params[:product_category_source_id]).id 
      @families = Family.where(product_category_source_id: product_category_source_id).paginate(page: params[:page], per_page: 20).order(
        created_at: :desc, id: :desc
      )
    else 
      @families = Family.all.paginate(page: params[:page], per_page: 20).order(created_at: :desc, id: :desc)
    end
  end

  # GET /families/1 or /families/1.json
  def show
  end

  def by_segment
    families = Family.where(segment_id: params[:segment_id])
    render json: families.select(:id, :code, :title)
  end

  # GET /families/new
  def new
    @family = Family.new
  end

  # GET /families/1/edit
  def edit
  end

  # POST /families or /families.json
  def create
    @family = Family.new(family_params)

    respond_to do |format|
      if @family.save
        format.html { redirect_to @family, notice: "Family was successfully created." }
        format.json { render :show, status: :created, location: @family }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /families/1 or /families/1.json
  def update
    respond_to do |format|
      if @family.update(family_params)
        format.html { redirect_to @family, notice: "Family was successfully updated." }
        format.json { render :show, status: :ok, location: @family }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /families/1 or /families/1.json
  def destroy
    @family.destroy

    respond_to do |format|
      format.html { redirect_to families_path, status: :see_other, notice: "Family was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
    end

    def set_dropdowns
      @segments = Segment.all
      @product_category_sources = ProductCategorySource.all
    end

    # Only allow a list of trusted parameters through.
    def family_params
      params.require(:family).permit(:code, :title, :description, :segment_id, :product_category_source_id)
    end
end
