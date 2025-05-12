class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy insert_company update_to_level_two]

  # GET /companies or /companies.json
  def index
    @companies = Company.all
  end

  def insert_company
    error = ""
    error += "company name is required, " if company_params[:name].blank?
    #error += "sector is required, " if company_params[:sector].blank?
    error += "industry category type is required" if company_params[:industry_category_type_id].blank?
    
    if error.length > 0 
      respond_to_invalid_entries(error, cit_record_company_capture_interface_path(cit_record_id: params[:company][:cit_record_id]))  
    else
      companies = Company.find_by_mid(company_params[:mid])
      if companies.any?
        if companies[0].update(company_params)
          CroupierCore::UpgradeCitLevel.call!(mid: company_params[:mid], company_id: companies[0].id, 
            company_name: company_params[:name], user_id: current_user.id)
          redirect_to cit_record_success_redirect_path(cit_record_id: params[:company][:cit_record_id]), notice: "company was successfully updated." and return
        end
      end
      @company = Company.new(company_params.except(:mid))
      @company.mids = [company_params[:mid]]
      respond_to do |format|
        if @company.save
          CroupierCore::UpgradeCitLevel.call!(mid: company_params[:mid], company_id: @company.id, 
          company_name: @company.name, user_id: current_user.id)
          format.html { redirect_to cit_record_success_redirect_path(cit_record_id: params[:company][:cit_record_id]), notice: "Company was successfully created." }
          format.json { render :show, status: :created, location: @company }
        else
          msg = @company.errors.map(&:attribute).map(&:to_s).join(" ") + " already exists"
          format.html { redirect_to cit_record_company_capture_interface_path(cit_record_id: params[:company][:cit_record_id]), notice: msg, status: :unprocessable_entity }
          format.json { render json: @company.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  def update_to_level_two
    @company = Company.find(params[:company_id])
    respond_to do |format|
      if @company.update(company_params.except(:mid))
        company_contact = CompanyContact.new(company_contact_params.except(:contact_name, :company_contact_type_id))
        company_contact.name = company_contact_params[:contact_name]
        company_contact.company_id = @company.id
        company_contact.company_contact_type_id = CompanyContactType.find_by(role: "CEO").id
        company_contact.save!
        CroupierCore::UpgradeCitLevel.call!(mid: company_params[:mid], company_id: @company.id, 
        company_name: @company.name, user_id: current_user.id)
        format.html { redirect_to cit_record_success_redirect_path(cit_record_id: params[:company][:cit_record_id]), notice: "company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
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

  

    def respond_to_invalid_entries(msg, path=new_product_path)
      respond_to do |format|
        format.html { redirect_to path, notice: msg, status: :unprocessable_entity }
        format.json { render json: {errors: [{barcode: msg}]}, status: :unprocessable_entity }
      end
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :sector, :postal_code, :logo, :mid, :industry_category_type_id, :address_1, :address_2, :city, :state, :country, :established, :website, :diversity_report, :diversity_score, :total_employees)
    end

    def company_contact_params
      params.require(:company).permit(:company_contact_type_id, :contact_name, :job_title, :email, :phone, :photo)
    end
end
