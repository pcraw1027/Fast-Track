require 'csv'

class Domains::Companies::IndustryCategoryTypesController < ApplicationController
  before_action :set_industry_category_type, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy, upload_linkedin_v_data, upload_linkedin_mappings]

  # GET /industry_category_types or /industry_category_types.json
  def index
    @industry_category_types = Domains::Companies::IndustryCategoryType.all
                                                                       .paginate(page: params[:page], per_page: 15).order(
                                                                         created_at: :desc, id: :desc
                                                                       )
  end

  # GET /industry_category_types/1 or /industry_category_types/1.json
  def show
  end

  def upload_linkedin_v_data
    file = params[:file]

    if file.blank? || !file.original_filename.end_with?('.csv')
      return redirect_to domains_companies_industry_category_types_path, alert: "Please upload a valid CSV file."
    end

    imported_count = 0

    ActiveRecord::Base.transaction do
      CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
        next if row[:industry_id].blank? || row[:label].blank?
        # row[:category_code_type_id_from] and row[:category_code_type_id_to]
        Domains::Companies::IndustryCategoryType.find_or_create_by!(
          category_code: row[:industry_id]&.strip,
          title: row[:label]&.strip,
          linkedin_version: "V2"
        )
        imported_count += 1
      end
    end

    redirect_to domains_companies_industry_category_type_mappings_path, notice: "Successfully imported #{imported_count} valid linkedin category data."
  rescue ActiveRecord::RecordInvalid, CSV::MalformedCSVError => e
    redirect_to domains_companies_industry_category_type_mappings_path, alert: "Import failed: #{e.message}"
  end


  def upload_linkedin_mappings
    file = params[:file]

    if file.blank? || !file.original_filename.end_with?('.csv')
      return redirect_to domains_companies_industry_category_types_path, alert: "Please upload a valid CSV file."
    end

    imported_count = 0

    ActiveRecord::Base.transaction do
      CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
        next if row[:category_code_type_id_from].blank? || row[:category_code_type_id_to].blank?
        
        ct =  Domains::Companies::IndustryCategoryType.find_by(category_code: row[:category_code_type_id_from]&.strip)
        lt = Domains::Companies::IndustryCategoryType.find_by(category_code: row[:category_code_type_id_to]&.strip)
        if ct && lt 
          Domains::Companies::IndustryCategoryTypeMapping.find_or_create_by!(
            category_code_type_from_id: ct.id,
            category_code_type_to_id: lt.id,
            mapping_type: 1
          )
          imported_count += 1
        end
      end
    end

    redirect_to domains_companies_industry_category_type_mappings_path, notice: "Successfully imported #{imported_count} valid mappings."
  rescue ActiveRecord::RecordInvalid, CSV::MalformedCSVError => e
    redirect_to domains_companies_industry_category_type_mappings_path, alert: "Import failed: #{e.message}"
  end

  def search
    if params[:q].present?
      query = "%#{ActiveRecord::Base.sanitize_sql_like(params[:q])}%"
      
      @companies = Domains::Companies::IndustryCategoryType
                    .where("title ILIKE ? OR category_code ILIKE ?", query, query)
                    .where.not(naics_year: nil)
                    .where(linkedin_version: nil) # Fixed typo: 'wwhere' -> 'where'
                    .limit(20)
    else
      @companies = Domains::Companies::IndustryCategoryType.none
    end
  
    render json: @companies.select(:id, :category_code, :title)
  end

  # GET /industry_category_types/new
  def new
    @industry_category_type = Domains::Companies::IndustryCategoryType.new
  end

  # GET /industry_category_types/1/edit
  def edit
  end

  # POST /industry_category_types or /industry_category_types.json
  def create
    @industry_category_type = Domains::Companies::IndustryCategoryType.new(industry_category_type_params)

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
      format.html do
 redirect_to domains_companies_industry_category_types_path, status: :see_other, 
notice: "Industry category type was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industry_category_type
      @industry_category_type = Domains::Companies::IndustryCategoryType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def industry_category_type_params
      params.require(:domains_companies_industry_category_type).permit(:category_code, :title, :naics_year, :linkedin_version)
    end
end
