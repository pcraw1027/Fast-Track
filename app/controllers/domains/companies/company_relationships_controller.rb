class Domains::Companies::CompanyRelationshipsController < ApplicationController
  before_action :set_company_relationship, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy]

  # GET /company_relationships or /company_relationships.json
  def index
    @company_relationships = Domains::Companies::CompanyRelationship.all
                                                                    .paginate(page: params[:page], per_page: 15).order(
                                                                      created_at: :desc, id: :desc
                                                                    )
  end

  # GET /company_relationships/1 or /company_relationships/1.json
  def show
  end

  # GET /company_relationships/new
  def new
    @company_relationship = Domains::Companies::CompanyRelationship.new
    @company_relationship_types = Domains::Companies::CompanyRelationshipType.all
    @parent_companies = Domains::Companies::Company.all
    @child_companies = Domains::Companies::Company.all
  end

  # GET /company_relationships/1/edit
  def edit
    @company_relationship_types = Domains::Companies::CompanyRelationshipType.all
    @parent_companies = Domains::Companies::Company.all
    @child_companies = Domains::Companies::Company.all
  end

  # POST /company_relationships or /company_relationships.json
  def create
    @company_relationship = Domains::Companies::CompanyRelationship.new(company_relationship_params)

    respond_to do |format|
      if @company_relationship.save
        format.html { redirect_to @company_relationship, notice: "Company relationship was successfully created." }
        format.json { render :show, status: :created, location: @company_relationship }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_relationships/1 or /company_relationships/1.json
  def update
    respond_to do |format|
      if @company_relationship.update(company_relationship_params)
        format.html { redirect_to @company_relationship, notice: "Company relationship was successfully updated." }
        format.json { render :show, status: :ok, location: @company_relationship }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_relationships/1 or /company_relationships/1.json
  def destroy
    @company_relationship.destroy

    respond_to do |format|
      format.html do
 redirect_to domains_companies_company_relationships_path, status: :see_other, 
notice: "Company relationship was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_relationship
      @company_relationship = Domains::Companies::CompanyRelationship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_relationship_params
      params.require(:domains_companies_company_relationship).permit(:company_relationship_type_id, :parent_company_id, :child_company_id)
    end
end
