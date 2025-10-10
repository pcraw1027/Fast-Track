class Domains::Companies::CompanyContactTypesController < ApplicationController
  before_action :set_company_contact_type, only: %i[ show edit update destroy ]

  # GET /company_contact_types or /company_contact_types.json
  def index
    @company_contact_types = Domains::Companies::CompanyContactType.all
  end

  # GET /company_contact_types/1 or /company_contact_types/1.json
  def show
  end

  # GET /company_contact_types/new
  def new
    @company_contact_type = Domains::Companies::CompanyContactType.new
  end

  # GET /company_contact_types/1/edit
  def edit
  end

  # POST /company_contact_types or /company_contact_types.json
  def create
    @company_contact_type = Domains::Companies::CompanyContactType.new(company_contact_type_params)

    respond_to do |format|
      if @company_contact_type.save
        format.html { redirect_to @company_contact_type, notice: "Company contact type was successfully created." }
        format.json { render :show, status: :created, location: @company_contact_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company_contact_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_contact_types/1 or /company_contact_types/1.json
  def update
    respond_to do |format|
      if @company_contact_type.update(company_contact_type_params)
        format.html { redirect_to @company_contact_type, notice: "Company contact type was successfully updated." }
        format.json { render :show, status: :ok, location: @company_contact_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company_contact_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_contact_types/1 or /company_contact_types/1.json
  def destroy
    @company_contact_type.destroy

    respond_to do |format|
      format.html do
 redirect_to domains_companies_company_contact_types_path, status: :see_other, 
notice: "Company contact type was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_contact_type
      @company_contact_type = Domains::Companies::CompanyContactType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_contact_type_params
      params.require(:domains_companies_company_contact_type).permit(:role, :definition)
    end
end
