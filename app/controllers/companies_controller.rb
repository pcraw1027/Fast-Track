class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show update destroy ]
  before_action :set_dropdowns, only: %i[ new ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy insert_company update_to_level_two update_to_level_three]

  # GET /companies or /companies.json
  def index
    @companies = Company.all
  end

  def insert_company
    if company_params[:industry_category_type_id].blank? 
        respond_to_invalid_entries("industry category type is required", company_capture_interface_path(mid: company_params[:mid]))  
    elsif (params[:company][:new_company_name].blank? && params[:company][:name].blank? && params[:company][:id].blank?  && !params[:company][:company_id]&.to_s&.match?(/^\d+$/))
      respond_to_invalid_entries("company name is required", company_capture_interface_path(mid: company_params[:mid])) 
    elsif !params[:company][:company_id].blank? && params[:company][:company_id]&.to_s&.match?(/^\d+$/) || (!params[:company][:id].blank?  && params[:company][:id]&.to_s&.match?(/^\d+$/)) || !params[:company][:name].blank?
       update_company
     else
          @company = Company.new(company_params.except(:mid))
          @company.name = params[:company][:new_company_name]
          mid = company_params[:mid]
          respond_to do |format|
            if @company.save
              cit_rec = nil
              if company_params[:mid].blank?
                mid = CitRecord.generate_mid(@company.id)
                cit_rec = CitRecordHandler.update_or_create(nil, mid: mid, source: "Company Import", 
                                user_id: current_user.id, company_id: @company.id, brand: nil)
              else
                cit_rec = CitRecord.find_by(mid: mid)
              end

              @company.update(mids: [cit_rec.mid])
              CroupierCore::UpgradeCitLevel.call!(mid: mid, company_id: @company.id, company_name: @company.name, user_id: current_user.id, level: 1)
              format.html { redirect_to company_capture_interface_path(mid: mid), notice: "Company was successfully created." }
              format.json { render :show, status: :created, location: @company }
            else
              msg = @company.errors.map{|er| "#{er.attribute} #{er.message}"}.join(", ")
              format.html { redirect_to company_capture_interface_path(mid: mid), alert: msg }
              format.json { render json: @company.errors, status: :unprocessable_entity }
            end
          end
        end
  end

  def update_to_level_two
    @company = Company.find(params[:company_id])
    respond_to do |format|
      begin
        @company.update(company_params.except(:mid))
        CroupierCore::UpgradeCitLevel.call!(mid: company_params[:mid], company_id: @company.id, 
        company_name: @company.name, user_id: current_user.id, level: 2)
        format.html { redirect_to company_capture_interface_path(mid: company_params[:mid]), notice: "company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      rescue => e
        format.html { redirect_to company_capture_interface_path(mid: company_params[:mid]), alert: e.message }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_to_level_three
     @company = Company.find(params[:company_id])
     respond_to do |format|
      begin
        convert_child_params
        convert_parent_params
        CroupierCore::UpgradeCitLevel.call!(mid: company_params[:mid], company_id: @company.id, company_name: @company.name, user_id: current_user.id, level: 3)
        format.html { redirect_to(company_capture_interface_path(mid: company_params[:mid]), notice: "Company was successfully updated.") and return }
        format.json { render :show, status: :created, location: @company }
      rescue => e
        format.html { redirect_to company_capture_interface_path(mid: company_params[:mid]), alert: e.message }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_to_level_four
     @company = Company.find(params[:company_id])
     respond_to do |format|
      begin
        @company.update(company_params.except(:mid))
        CroupierCore::UpgradeCitLevel.call!(mid: company_params[:mid], company_id: @company.id, company_name: @company.name, user_id: current_user.id, level: 4)
        format.html { redirect_to company_capture_interface_path(mid: company_params[:mid]), notice: "Company was successfully updated." }
        format.json { render :show, status: :created, location: @company }
      rescue => e
        format.html { redirect_to company_capture_interface_path(mid: company_params[:mid]), alert: e.message }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end


  def update_to_level_five
     @company = Company.find(params[:company_id])
     respond_to do |format|
      begin
        @company.update(company_snapshot_params)
        CroupierCore::UpgradeCitLevel.call!(mid: company_params[:mid], company_id: @company.id, company_name: @company.name, user_id: current_user.id, level: 5)
        format.html { redirect_to company_capture_interface_path(mid: company_params[:mid]), notice: "Company was successfully updated." }
        format.json { render :show, status: :created, location: @company }
      rescue => e
        format.html { redirect_to company_capture_interface_path(mid: company_params[:mid]), alert: e.message }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end


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



  def new
    @company = Company.new
  end


  def edit
    redirect_to(company_capture_interface_path(company_id: params[:id], level: 0, from_edit: true))
  end


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


  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_path, status: :see_other, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end

  end



  private


 
  def set_company
    @company = Company.find(params[:id])
  end

  def set_dropdowns
    @industry_category_types = IndustryCategoryType.all
  end

  def update_company
    company_id = params[:company][:company_id].blank? ? params[:company][:id] : params[:company][:company_id]
    company = Company.find(company_id)
    if company.update(company_params.except(:mid))
      CroupierCore::UpgradeCitLevel.call!(mid: company_params[:mid], company_id: company.id, 
        company_name: company_params[:name], user_id: current_user.id, level: 1)
  
    respond_to do |format|
      format.html { redirect_to edit_company_path(company), notice: "company was successfully updated."  and return  }
      format.json { render json: {errors: [{barcode: msg}]}, status: :unprocessable_entity and return }
    end

    end
  end

  def respond_to_invalid_entries(msg, path=new_product_path)
    respond_to do |format|
      format.html { redirect_to path, notice: msg and return  }
      format.json { render json: {errors: [{barcode: msg}]}, status: :unprocessable_entity and return }
    end
  end

  def convert_child_params
    unless company_relationship_params[:child_relationships_attributes].blank?
      company_relationship_params[:child_relationships_attributes].each do |key, child_attributes|
        child_company_id = child_attributes[:child_company_id]
        child_company_id = spawned_company_id(child_attributes, child_attributes[:child_company_id]) if !child_company_id&.to_s&.match?(/^\d+$/)
        CompanyRelationship.create!(
          company_relationship_type_id: child_attributes[:company_relationship_type_id], 
          parent_company_id: @company.id, child_company_id: child_company_id)
      end
    end
  end

  def convert_parent_params
    unless company_relationship_params[:parent_relationships_attributes].blank?
      company_relationship_params[:parent_relationships_attributes].each do |key, parent_attributes|
        parent_company_id = parent_attributes[:parent_company_id]
        parent_company_id = spawned_company_id(parent_attributes, parent_attributes[:parent_company_id]) if !parent_company_id&.to_s&.match?(/^\d+$/)
        CompanyRelationship.create!(
          company_relationship_type_id: parent_attributes[:company_relationship_type_id], 
          parent_company_id: parent_company_id, child_company_id: @company.id
        )
      end
    end
  end

  def spawned_company_id(attributes, new_company_name)
    company = Company.create!(
      name: new_company_name,
      logo: attributes[:logo]
    )
    
    mid = CitRecord.generate_mid(company.id)
    cit_rec = CitRecordHandler.update_or_create(nil, mid: mid, source: "Company Import", 
                  user_id: current_user.id, company_id: company.id, brand: nil)
    company.update(mids: [cit_rec.mid])
    CitLevelUser.find_or_create_by!(level: 3, user_id: current_user.id, cit_record_id: cit_rec.id ) if cit_rec
    return company.id
  end


  def company_params
        params.require(:company).permit(:id, :name, :sector, :logo, :mid, 
            :industry_category_type_id,  
            :black_owned, :female_owned, :established, :website, :diversity_report, 
            :diversity_score, :total_employees,
            addresses_attributes: [:id, :address_type_id, :addressable_id, :address1, :address2, :city, 
                  :state, :postal_code, :country_reference_id, :_destroy],
            company_contacts_attributes: [
                  :id, :company_contact_type_id, :name, :job_title, :email, :phone, :photo, :_destroy,
                  person_attributes: [
                    :id, :title, :first_name, :middle_name, :last_name, :letters,
                    :gender_type_id, :ethnicity_type_id, :country_reference_id,
                    :picture, :email, :website
                  ]
                ]
            )
  end

  def company_relationship_params
        params.require(:company).permit(
            parent_relationships_attributes: [:id, :parent_company_id, 
                      :company_relationship_type_id, :logo, :_destroy],
            child_relationships_attributes: [:id, :child_company_id, 
                      :company_relationship_type_id, :logo, :_destroy]
            )
  end

  def company_snapshot_params
        params.require(:company).permit(
            company_snapshot_attributes: [:id, :data_transparency, :internal_culture,
                    :mgmt_composition,  :_destroy]
            )
  end


  def company_contact_params
    params.require(:company).permit(:company_contact_type_id, :contact_name, :job_title, :email, :phone, :photo)
  end

end

