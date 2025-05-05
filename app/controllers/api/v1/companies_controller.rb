class Api::V1::CompaniesController < Api::V1::BaseController
  before_action :authenticate_user!


  def show
    company = Company.includes(:industry_category_type,:parent_relationships,
          :parent_companies, :child_relationships, :child_companies, :company_contacts,
          :company_ethnicity_stats, :company_gender_stats).find(params[:id])
    render json: {
        company: company,
        industry_category_type: company.industry_category_type,
        parent_relationships: company.parent_relationships,
        parent_companies: company.parent_companies,
        child_relationships: company.child_relationships,
        child_companies: company.child_companies,
        company_contacts: company.company_contacts,
        company_ethnicity_stats: company.company_ethnicity_stats,
        company_gender_stats: company.company_gender_stats
      }, status: :ok
  end

end