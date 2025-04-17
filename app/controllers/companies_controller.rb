class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit ]

  # GET /companies or /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1 or /companies/1.json
  def show
    @products = Product.where(company_id: params[:id])
    @product_attributes = ProductAttribute.where(company_id: params[:id])
    @company_relationships = CompanyRelationship.where(parent_company_id: params[:id]).or(CompanyRelationship.where(child_company_id: params[:id]))
    @company_contacts = CompanyContact.where(company_id: params[:id])
    @company_ethnicity_stats = CompanyEthnicityStat.where(company_id: params[:id])
    @company_gender_stats = CompanyGenderStat.where(company_id: params[:id])
  end


def search
  companies = if params[:q].present?
                Company.where("name ILIKE ?", "%#{params[:q]}%").limit(20)
              else
                Company.none
              end

  render json: companies.select(:id, :name)
end


  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    @products = Product.all
  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params.except(:mid))
    @company.mids = [company_params[:mid]]
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_path, status: :see_other, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    def set_dropdowns
      @industry_category_types = IndustryCategoryType.all
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :sector, :logo, :mid, :industry_category_type_id, :address_1, :address_2, :city, :state, :country, :established, :website, :diversity_report, :diversity_score, :total_employees)
    end
end
