class Api::V1::CompaniesController < Api::V1::BaseController
  before_action :authenticate_user!

  def increment_search
     Company.find(params[:id])&.increment!(:searches)
     render json: { message: "increment success!" }, status: :ok
  end

  def show
      company = Company.includes(:industry_category_type, :company_snapshot,
          :company_ethnicity_stats, :company_gender_stats).find(params[:id])
    
      parent_company = CompanyRelationship.parents(params[:id])&.map{|cr| {details: cr, parent_company: cr.parent_company}}&.first
      subsidiaries_companies = CompanyRelationship.children(params[:id])&.map{|cr| {details: cr, child_company: cr.child_company}}

      subsidiary_data = {title: "Subsidiaries/Brands", subsidiaries_companies: subsidiaries_companies}
      if subsidiaries_companies.blank? && parent_company.present?
         subsidiaries_companies = CompanyRelationship.children(parent_company[:details].parent_company_id)
         subsidiary_data = {title: "Sister Subsidiaries/Brands", subsidiaries_companies: subsidiaries_companies.select{|c| c.child_company.id != company.id} } if subsidiaries_companies.any?
      end
      
    company_ceo_data = nil
    company_ceo_result = CompanyContact.company_ceo(params[:id])

    unless company_ceo_result.empty?
        data = company_ceo_result.first
        person = data.person
        company_ceo_data = {
          id: data.id,
          person_id: data.person_id,
          first_name: person&.first_name,
          middle_name: person&.middle_name,
          last_name: person&.last_name,
          role: data.company_contact_type.role,
          photo: data.photo,
          email: data.email,
          phone: data.phone
        } 
    end

    rating_distribution = Review.rating_distribution_for(company)
    review_stats = Review.stats_for(company)
    render json: {
        level_1_flag: company.level_1_flag,
        company: company,
        industry_category_type: company.industry_category_type,
        parent_company: parent_company,
        subsidiaries: subsidiary_data,
        company_ceo: company_ceo_data,
        company_ethnicity_stats: company.company_ethnicity_stats,
        company_gender_stats: company.company_gender_stats,
        company_snapshot: company.company_snapshot,
        review_stats: review_stats,
        rating_distribution: rating_distribution
      }, status: :ok
  end

end