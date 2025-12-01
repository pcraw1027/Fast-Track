class Domains::Companies::CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show update destroy ]
  before_action :set_dropdowns, only: %i[ new ]
  before_action :authenticate_user!, 
only: %i[ new edit update create destroy insert_company update_to_level_two update_to_level_three]

  # GET /companies or /companies.json
  def index
    @companies = if params[:q].present?
                Domains::Companies::Company.where("name ILIKE ?", "%#{params[:q]}%").paginate(page: params[:page], per_page: 15).order(
                  created_at: :desc, id: :desc
                )
                 else
                Domains::Companies::Company.all.paginate(page: params[:page], per_page: 15).order(created_at: :desc, id: :desc)
                 end
    
  end


  def insert_company
    if company_params[:industry_category_type_id].blank? 
        respond_to_invalid_entries("industry category type is required", 
      company_capture_interface_path(mid: company_params[:mid]))  
    elsif params[:domains_companies_company][:new_company_name].blank? && params[:domains_companies_company][:name].blank? && params[:domains_companies_company][:id].blank? && !params[:domains_companies_company][:company_id]&.to_s&.match?(/^\d+$/)
      respond_to_invalid_entries("company name is required", company_capture_interface_path(mid: company_params[:mid])) 
    elsif (params[:domains_companies_company][:company_id].present? && params[:domains_companies_company][:company_id]&.to_s&.match?(/^\d+$/)) || (params[:domains_companies_company][:id].present? && params[:domains_companies_company][:id]&.to_s&.match?(/^\d+$/)) || params[:domains_companies_company][:name].present?
       update_company
    else
          @company = Domains::Companies::Company.new(company_params.except(:mid, :id))
          @company.name = params[:domains_companies_company][:new_company_name]
          mid = company_params[:mid]
          respond_to do |format|
             if @company.save
              if company_params[:mid].blank?
                mid = Domains::CroupierCore::CitRecord.generate_mid(@company.id)
                Domains::CroupierCore::CitRecordHandler.update_or_create(nil, mid: mid, source: "Company Import",
                                user_id: current_user.id, company_id: @company.id, brand: nil)
              end
              Domains::CroupierCore::Operations::UpgradeCitLevel
                .call!(mid: mid, company_id: @company.id, user_id: current_user.id, level: 1)
              format.html do
                redirect_to company_capture_interface_path(mid: mid, filter_by: params[:domains_companies_company][:filter_by]), 
                notice: "Company was successfully created."
              end
              format.json { render :show, status: :created, location: @company }
             else
              msg = @company.errors.map { |er| "#{er.attribute} #{er.message}" }.join(", ")
              format.html do
 redirect_to company_capture_interface_path(mid: mid, filter_by: params[:domains_companies_company][:filter_by]), alert: msg
              end
              format.json { render json: @company.errors, status: :unprocessable_entity }
             end
          end
    end
  end

  def update_to_level_two
    @company = Domains::Companies::Company.find(params[:company_id])
    respond_to do |format|
      
        @company.update!(company_params.except(:mid))
        Domains::CroupierCore::Operations::UpgradeCitLevel.call!(mid: company_params[:mid], company_id: @company.id, 
        user_id: current_user.id, level: 2)
        format.html do
 redirect_to company_capture_interface_path(mid: company_params[:mid], filter_by: params[:domains_companies_company][:filter_by]), 
notice: "company was successfully updated."
        end
        format.json { render :show, status: :ok, location: @company }
    rescue StandardError => e
        format.html do
 redirect_to company_capture_interface_path(mid: company_params[:mid], filter_by: params[:domains_companies_company][:filter_by]), 
alert: e.message
        end
        format.json { render json: @company.errors, status: :unprocessable_entity }
      
    end
  end

  def update_to_level_three
     @company = Domains::Companies::Company.find(params[:company_id])
     respond_to do |format|
      
        convert_child_params
        convert_parent_params
        Domains::CroupierCore::Operations::UpgradeCitLevel.call!(mid: company_params[:mid], company_id: @company.id, 
user_id: current_user.id, level: 3)
        format.html do
 redirect_to(company_capture_interface_path(mid: company_params[:mid], filter_by: params[:domains_companies_company][:filter_by]), 
notice: "Company was successfully updated.") and return
        end
        format.json { render :show, status: :created, location: @company }
     rescue StandardError => e
        format.html do
 redirect_to company_capture_interface_path(mid: company_params[:mid], filter_by: params[:domains_companies_company][:filter_by]), 
alert: e.message
        end
        format.json { render json: @company.errors, status: :unprocessable_entity }
      
     end
  end

  def update_to_level_four
    @company = Domains::Companies::Company.find(params[:company_id])

     respond_to do |format|
      
        convert_company_contact_params
        Domains::CroupierCore::Operations::UpgradeCitLevel.call!(mid: company_params[:mid], company_id: @company.id, 
user_id: current_user.id, level: 4)
        format.html do
 redirect_to company_capture_interface_path(mid: company_params[:mid], filter_by: params[:domains_companies_company][:filter_by]), 
notice: "Company was successfully updated."
        end
        format.json { render :show, status: :created, location: @company }
     rescue StandardError => e
        format.html do
 redirect_to company_capture_interface_path(mid: company_params[:mid], filter_by: params[:domains_companies_company][:filter_by]), 
alert: e.message
        end
        format.json { render json: @company.errors, status: :unprocessable_entity }
      
     end
  end


  def update_to_level_five
     @company = Domains::Companies::Company.find(params[:company_id])
     respond_to do |format|
      
        @company.update!(company_snapshot_params)
        Domains::CroupierCore::Operations::UpgradeCitLevel.call!(mid: company_params[:mid], company_id: @company.id, 
user_id: current_user.id, level: 5)
        format.html do
 redirect_to company_capture_interface_path(mid: company_params[:mid], filter_by: params[:domains_companies_company][:filter_by]), 
notice: "Company was successfully updated."
        end
        format.json { render :show, status: :created, location: @company }
     rescue StandardError => e
        format.html do
 redirect_to company_capture_interface_path(mid: company_params[:mid], filter_by: params[:domains_companies_company][:filter_by]), 
alert: e.message
        end
        format.json { render json: @company.errors, status: :unprocessable_entity }
      
     end
  end


  def show
    @products = Domains::Products::Product.where(company_id: params[:id])
    @product_attributes = Domains::Classifications::ProductAttribute.where(company_id: params[:id])
    @company_relationships = Domains::Companies::CompanyRelationship.where(
      parent_company_id: params[:id]
    ).or(Domains::Companies::CompanyRelationship.where(child_company_id: params[:id]))
    @company_contacts = Domains::Companies::CompanyContact.where(company_id: params[:id])
    @company_ethnicity_stats = Domains::Companies::CompanyEthnicityStat.where(company_id: params[:id])
    @company_gender_stats = Domains::Companies::CompanyGenderStat.where(company_id: params[:id])
  end


def search
  companies = if params[:q].present?
                Domains::Companies::Company.where("name ILIKE ?", "%#{params[:q]}%").limit(20)
              else
                Domains::Companies::Company.none
              end

  render json: companies.select(:id, :name)
end



  def new
    @company = Domains::Companies::Company.new
  end


  def edit
    redirect_to(company_capture_interface_path(company_id: params[:id], level: params[:level], from_edit: true, 
filter_by: params[:filter_by]))
  end


  def create
    @company = Domains::Companies::Company.new(company_params.except(:mid))
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
      format.html { redirect_to domains_companies_companies_path, status: :see_other, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private


 
  def set_company
    @company = Domains::Companies::Company.find(params[:id])
  end

  def set_dropdowns
    @industry_category_types = Domains::Companies::IndustryCategoryType.all
  end

  def update_company
    company_id = params[:domains_companies_company][:company_id].presence || params[:domains_companies_company][:id]
    company = Domains::Companies::Company.find(company_id)

    respond_to do |format|
      
        company.update!(company_params.except(:mid))
         if company_params[:mid].blank?

            sys_gen_mid = Domains::CroupierCore::CitRecord.generate_mid(company.id)

            Domains::CroupierCore::CitRecordHandler.update_or_create(nil, mid: sys_gen_mid, source: "Company Import", 
                            user_id: current_user.id, company_id: company.id, brand: nil)

            Domains::CroupierCore::Operations::UpgradeCitLevel.call!(mid: sys_gen_mid, company_id: company.id, 
                          user_id: current_user.id, level: 1)

         else
            Domains::CroupierCore::Operations::UpgradeCitLevel.call!(mid: company_params[:mid], company_id: company.id, 
            user_id: current_user.id, level: 1)
         end
        
        format.html do
 redirect_to edit_domains_companies_company_path(id: company.id, level: params[:domains_companies_company][:level], filter_by: params[:domains_companies_company][:filter_by]), 
notice: "company was successfully updated." and return
        end
        format.json { render json: company, status: :ok and return }
    rescue StandardError => e
        format.html do
 redirect_to company_capture_interface_path(mid: company_params[:mid], level: params[:domains_companies_company][:level], filter_by: params[:domains_companies_company][:filter_by]), 
alert: e.message and return
        end
        format.json { render json: company.errors, status: :unprocessable_entity and return }
      
    end
  end



  def respond_to_invalid_entries(msg, path = new_company_path)
    respond_to do |format|
      format.html { redirect_to path, alert: msg and return  }
      format.json { render json: { errors: [{ barcode: msg }] }, status: :unprocessable_entity and return }
    end
  end  


  def convert_company_contact_params
    return if company_contact_params[:company_contacts_attributes].blank?

      company_contact_params[:company_contacts_attributes].each_value do |contact_attributes|
        if contact_attributes[:_destroy] && contact_attributes[:_destroy] != "false"
          cr = Domains::Companies::CompanyContact.find(contact_attributes[:id])
          cr&.destroy
        elsif contact_attributes[:id].present?
          person_id = spawned_person_id(contact_attributes)
          cp = Domains::Companies::CompanyContact.find(contact_attributes[:id])
          if cp && person_id
            cp.update(
              company_contact_type_id: contact_attributes[:company_contact_type_id], 
              job_title: contact_attributes[:job_title], 
              person_id: person_id, 
              email: contact_attributes[:email],
              phone: contact_attributes[:phone], 
              photo: contact_attributes[:photo]
            )
          end
        else
          person_id = spawned_person_id(contact_attributes)
          if person_id
            Domains::Companies::CompanyContact.create!(
              company_contact_type_id: contact_attributes[:company_contact_type_id], 
              job_title: contact_attributes[:job_title], 
              person_id: person_id, 
              email: contact_attributes[:email],
              phone: contact_attributes[:phone], 
              photo: contact_attributes[:photo],
              company_id: @company.id
            )
          end
        end
      end
    
  end


  def convert_child_params
    return if company_relationship_params[:child_relationships_attributes].blank?

      company_relationship_params[:child_relationships_attributes].each_value do |child_attributes|
        if child_attributes[:_destroy] && child_attributes[:_destroy] != "false"
          cr = Domains::Companies::CompanyRelationship.find(child_attributes[:id])
          cr&.destroy
        elsif child_attributes[:id]
          cp = Domains::Companies::Company.find(child_attributes[:child_company_id])
          if child_attributes[:logo]
            cp&.update(
              logo: child_attributes[:logo]
            )
          end
        else
          child_company_id = child_attributes[:child_company_id]
          unless child_company_id&.to_s&.match?(/^\d+$/)
            child_company_id = spawned_company_id(child_attributes, 
child_attributes[:child_company_id])
          end
          Domains::Companies::CompanyRelationship.create!(
            company_relationship_type_id: child_attributes[:company_relationship_type_id], 
            parent_company_id: @company.id, child_company_id: child_company_id
          )
        end
      end
    
  end

  def convert_parent_params
    return if company_relationship_params[:parent_relationships_attributes].blank?

      company_relationship_params[:parent_relationships_attributes].each_value do |parent_attributes|
        if parent_attributes[:_destroy] && parent_attributes[:_destroy] != "false"
          cr = Domains::Companies::CompanyRelationship.find(parent_attributes[:id])
          cr&.destroy
        elsif parent_attributes[:id]
          cp = Domains::Companies::Company.find(parent_attributes[:parent_company_id])
          if parent_attributes[:logo]
            cp&.update(
              logo: parent_attributes[:logo]
            )
          end
        else
          parent_company_id = parent_attributes[:parent_company_id]
          unless parent_company_id&.to_s&.match?(/^\d+$/)
            parent_company_id = spawned_company_id(parent_attributes, 
parent_attributes[:parent_company_id])
          end
          Domains::Companies::CompanyRelationship.create!(
            company_relationship_type_id: parent_attributes[:company_relationship_type_id], 
            parent_company_id: parent_company_id, child_company_id: @company.id
          )
        end
      end
    
  end

  def spawned_person_id(contact_attributes)
    person_id = contact_attributes[:person_id]
    if person_id.blank?
      person = Domains::People::Person.create(
        first_name: contact_attributes[:first_name],
        last_name: contact_attributes[:last_name],
        middle_name: contact_attributes[:middle_name]
      )
      person_id = person.id
    end
    person_id
  end

  def spawned_company_id(attributes, new_company_name)
    company = Domains::Companies::Company.create!(
      name: new_company_name,
      logo: attributes[:logo]
    )
    
    mid = Domains::CroupierCore::CitRecord.generate_mid(company.id)
    cit_rec = Domains::CroupierCore::CitRecordHandler.update_or_create(nil, mid: mid, source: "Company Import", 
                  user_id: current_user.id, company_id: company.id, brand: nil)
    Domains::CroupierCore::CitLevelUser.find_or_create_by!(level: 3, user_id: current_user.id, cit_record_id: cit_rec.id) if cit_rec
    company.id
  end

  def company_params
        prm = params.require(:domains_companies_company).permit(:id, :name, :sector, :logo, :mid, 
            :industry_category_type_id,  
            :black_owned, :female_owned, :established, :website, :diversity_report, 
            :diversity_score, :total_employees,
            addresses_attributes: [:id, :address_type_id, :addressable_id, :address1, :address2, :city, 
                                   :state, :postal_code, :country_reference_id, :_destroy])
      prm[:established] = (Date.new(prm[:established].to_i) if prm[:established].present? && prm[:established].match?(/\A\d{4}\z/))
      prm
  end

  def company_contact_params
        params.require(:domains_companies_company).permit(
          company_contacts_attributes: [
            :id, :company_contact_type_id, :job_title, :person_id, :phone, :first_name, 
            :last_name, :middle_name, :email, :phone, :photo, :_destroy
          ]
        )
  end

  def company_relationship_params
        params.require(:domains_companies_company).permit(
          parent_relationships_attributes: [:id, :parent_company_id, 
                                            :company_relationship_type_id, :logo, :_destroy],
          child_relationships_attributes: [:id, :child_company_id, 
                                           :company_relationship_type_id, :logo, :_destroy]
        )
  end

  def company_snapshot_params
        params.require(:domains_companies_company).permit(
          company_snapshot_attributes: [:id, :employee_demographics_transparency, 
                                        :employee_demographics_performance, :projected_culture_and_identity, 
                                        :mgmt_composition_transparency, :mgmt_composition_performance,  :_destroy]
        )
  end


end

