class Domains::Companies::CompanyEthnicityStatsController < ApplicationController
  before_action :set_company_ethnicity_stat, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit create ]

  # GET /company_ethnicity_stats or /company_ethnicity_stats.json
  def index
    @company_ethnicity_stats = Domains::Companies::CompanyEthnicityStat.all
  end

  # GET /company_ethnicity_stats/1 or /company_ethnicity_stats/1.json
  def show
  end

  # GET /company_ethnicity_stats/new
  def new
    @company_ethnicity_stat = Domains::Companies::CompanyEthnicityStat.new
  end

  # GET /company_ethnicity_stats/1/edit
  def edit
  end

  # POST /company_ethnicity_stats or /company_ethnicity_stats.json
  def create
    @company_ethnicity_stat = Domains::Companies::CompanyEthnicityStat.new(company_ethnicity_stat_params)

    respond_to do |format|
      if @company_ethnicity_stat.save
        format.html { redirect_to @company_ethnicity_stat, notice: "Company ethnicity stat was successfully created." }
        format.json { render :show, status: :created, location: @company_ethnicity_stat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company_ethnicity_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_ethnicity_stats/1 or /company_ethnicity_stats/1.json
  def update
    respond_to do |format|
      if @company_ethnicity_stat.update(company_ethnicity_stat_params)
        format.html { redirect_to @company_ethnicity_stat, notice: "Company ethnicity stat was successfully updated." }
        format.json { render :show, status: :ok, location: @company_ethnicity_stat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company_ethnicity_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_ethnicity_stats/1 or /company_ethnicity_stats/1.json
  def destroy
    @company_ethnicity_stat.destroy

    respond_to do |format|
      format.html do
 redirect_to domains_companies_company_ethnicity_stats_path, status: :see_other, 
notice: "Company ethnicity stat was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_ethnicity_stat
      @company_ethnicity_stat = Domains::Companies::CompanyEthnicityStat.find(params[:id])
    end

    def set_dropdowns
      @company = Domains::Companies::Company.all
      @ethnicity_types = Domains::Companies::EthnicityType.all
      @employee_types = Domains::Companies::EmployeeType.all
    end

    # Only allow a list of trusted parameters through.
    def company_ethnicity_stat_params
      params.require(:domains_companies_company_ethnicity_stat).permit(:company_id, :ethnicity_type_id, :employee_type_id, :count, 
:percentage)
    end
end
