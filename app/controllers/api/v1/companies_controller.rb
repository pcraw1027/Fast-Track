class Api::V1::CompaniesController < Api::V1::BaseController
  before_action :authenticate_user!


  def show
    company = Company.includes(:industry_category_type,:company_contacts,
          :company_ethnicity_stats, :company_gender_stats).find(params[:id])
    company_relationships = CompanyRelationship.includes(:company_relationship_type, :parent_company, 
          :child_company).where(parent_company_id: params[:id]).or(CompanyRelationship.includes(:company_relationship_type, :parent_company, 
          :child_company).where(child_company_id: params[:id]))
      mapped_company_relationships = company_relationships.map{|cr|
      {company_relationship_type: cr.company_relationship_type,
        parent_company: cr.parent_company,
        child_company: cr.child_company }}

    rating_distribution = Review.rating_distribution_for(company)
    review_stats = Review.stats_for(company)
    render json: {
        company: company,
        industry_category_type: company.industry_category_type,
        company_relationships: mapped_company_relationships,
        company_contacts: company.company_contacts,
        company_ethnicity_stats: company.company_ethnicity_stats,
        company_gender_stats: company.company_gender_stats,
        review_stats: review_stats,
        rating_distribution: rating_distribution
      }, status: :ok
  end

end