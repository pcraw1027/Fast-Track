class Api::V1::Companies::CompaniesController < Api::V1::BaseController
  before_action :authenticate_user!

  def increment_search
     Domains::Companies::Company.find(params[:id])&.increment!(:searches)
     render json: { message: "increment success!" }, status: :ok
  end

  def show
      company = Domains::Companies::Company.includes(:industry_category_type, :company_snapshot,
          :company_ethnicity_stats, :company_gender_stats).find(params[:id])
    
      parent_company = Domains::Companies::CompanyRelationship.parents(params[:id])&.map do |cr|
 { details: cr, parent_company: cr.parent_company }
      end&.first
      subsidiaries_companies = Domains::Companies::CompanyRelationship.children(params[:id])&.map do |cr|
 { details: cr, child_company: cr.child_company }
      end

      subsidiary_data = { title: "Subsidiaries/Brands", subsidiaries_companies: subsidiaries_companies }
      if subsidiaries_companies.blank? && parent_company.present?
         subsidiaries_companies = Domains::Companies::CompanyRelationship
                                  .children(parent_company[:details].parent_company_id)&.map do |cr|
                                    { details: cr, child_company: cr.child_company }
         end
         if subsidiaries_companies.any?
           subsidiary_data = {
             title: "Sister Subsidiaries/Brands", 
                    subsidiaries_companies: subsidiaries_companies.reject do |c|
                              c[:child_company].id == company.id
                    end 
           }
         end
      end
      
    company_ceo_data = nil
    company_ceo_result = Domains::Companies::CompanyContact.company_ceo(params[:id])

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

    rating_distribution = Domains::Features::Reviewable::Review.rating_distribution_for(company)
    review_stats = Domains::Features::Reviewable::Review.stats_for(company)
    
    
    company.sector = company.industry_category_type.title if company.sector.blank? && company.industry_category_type_id.present?


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