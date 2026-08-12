class Domains::Companies::IndustryCategoryTypeMappingsController < ApplicationController
  before_action :set_industry_category_type_mapping, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy]

  # GET /industry_category_type_mappings or /industry_category_type_mappings.json
  def index
    @industry_category_type_mappings = Domains::Companies::IndustryCategoryTypeMapping
                                    .includes(:category_code_type_from, :category_code_type_to)
                                    .order(created_at: :desc, id: :desc)
                                    .paginate(page: params[:page], per_page: 15)
  end

  # GET /industry_category_type_mappings/1 or /industry_category_type_mappings/1.json
  def show
  end

  def search
    if params[:q].present?
      query = "%#{params[:q]}%"
      @companies = Domains::Companies::IndustryCategoryTypeMapping
                  .where("title ILIKE ? OR category_code ILIKE ?", query, query)
                  .limit(20)
    else
      @companies = Domains::Companies::IndustryCategoryTypeMapping.none
    end
  
    render json: @companies.select(:id, :category_code, :title)
  end

  # GET /industry_category_type_mappings/new
  def new
    @industry_category_type_mapping = Domains::Companies::IndustryCategoryTypeMapping.new
  end

  # GET /industry_category_type_mappings/1/edit
  def edit
  end

  # POST /industry_category_type_mappings or /industry_category_type_mappings.json
  def create
    @industry_category_type_mapping = Domains::Companies::IndustryCategoryTypeMapping.new(industry_category_type_mapping_params)

    respond_to do |format|
      if @industry_category_type_mapping.save
        format.html { redirect_to @industry_category_type_mapping, notice: "Industry category type mapping was successfully created." }
        format.json { render :show, status: :created, location: @industry_category_type_mapping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @industry_category_type_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /industry_category_type_mappings/1 or /industry_category_type_mappings/1.json
  def update
    respond_to do |format|
      if @industry_category_type_mapping.update(industry_category_type_mapping_params)
        format.html { redirect_to @industry_category_type_mapping, notice: "Industry category type mapping was successfully updated." }
        format.json { render :show, status: :ok, location: @industry_category_type_mapping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @industry_category_type_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industry_category_type_mappings/1 or /industry_category_type_mappings/1.json
  def destroy
    @industry_category_type_mapping.destroy

    respond_to do |format|
      format.html do
 redirect_to domains_companies_industry_category_type_mappings_path, status: :see_other, 
notice: "Industry category type mapping was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industry_category_type_mapping
      @industry_category_type_mapping = Domains::Companies::IndustryCategoryTypeMapping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def industry_category_type_mapping_params
      params.require(:domains_companies_industry_category_type_mapping).permit(:mapping_type, :category_code_type_from_id, :category_code_type_to_id)
    end
end
