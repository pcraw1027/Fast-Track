class IndustryCategoryTypesController < ApplicationController
  before_action :set_industry_category_type, only: %i[ show edit update destroy ]

  # GET /industry_category_types or /industry_category_types.json
  def index
    @industry_category_types = IndustryCategoryType.all
  end

  # GET /industry_category_types/1 or /industry_category_types/1.json
  def show
  end

  # GET /industry_category_types/new
  def new
    @industry_category_type = IndustryCategoryType.new
  end

  # GET /industry_category_types/1/edit
  def edit
  end

  # POST /industry_category_types or /industry_category_types.json
  def create
    @industry_category_type = IndustryCategoryType.new(industry_category_type_params)

    respond_to do |format|
      if @industry_category_type.save
        format.html { redirect_to @industry_category_type, notice: "Industry category type was successfully created." }
        format.json { render :show, status: :created, location: @industry_category_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @industry_category_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /industry_category_types/1 or /industry_category_types/1.json
  def update
    respond_to do |format|
      if @industry_category_type.update(industry_category_type_params)
        format.html { redirect_to @industry_category_type, notice: "Industry category type was successfully updated." }
        format.json { render :show, status: :ok, location: @industry_category_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @industry_category_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industry_category_types/1 or /industry_category_types/1.json
  def destroy
    @industry_category_type.destroy

    respond_to do |format|
      format.html { redirect_to industry_category_types_path, status: :see_other, notice: "Industry category type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industry_category_type
      @industry_category_type = IndustryCategoryType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def industry_category_type_params
      params.require(:industry_category_type).permit(:category_code, :title, :naics_year)
    end
end
