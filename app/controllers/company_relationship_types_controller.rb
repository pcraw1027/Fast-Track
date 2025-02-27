class CompanyRelationshipTypesController < ApplicationController
  before_action :set_company_relationship_type, only: %i[ show edit update destroy ]

  # GET /company_relationship_types or /company_relationship_types.json
  def index
    @company_relationship_types = CompanyRelationshipType.all
  end

  # GET /company_relationship_types/1 or /company_relationship_types/1.json
  def show
  end

  # GET /company_relationship_types/new
  def new
    @company_relationship_type = CompanyRelationshipType.new
  end

  # GET /company_relationship_types/1/edit
  def edit
  end

  # POST /company_relationship_types or /company_relationship_types.json
  def create
    @company_relationship_type = CompanyRelationshipType.new(company_relationship_type_params)

    respond_to do |format|
      if @company_relationship_type.save
        format.html { redirect_to @company_relationship_type, notice: "Company relationship type was successfully created." }
        format.json { render :show, status: :created, location: @company_relationship_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company_relationship_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_relationship_types/1 or /company_relationship_types/1.json
  def update
    respond_to do |format|
      if @company_relationship_type.update(company_relationship_type_params)
        format.html { redirect_to @company_relationship_type, notice: "Company relationship type was successfully updated." }
        format.json { render :show, status: :ok, location: @company_relationship_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company_relationship_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_relationship_types/1 or /company_relationship_types/1.json
  def destroy
    @company_relationship_type.destroy

    respond_to do |format|
      format.html { redirect_to company_relationship_types_path, status: :see_other, notice: "Company relationship type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_relationship_type
      @company_relationship_type = CompanyRelationshipType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_relationship_type_params
      params.require(:company_relationship_type).permit(:relationship, :definition)
    end
end
