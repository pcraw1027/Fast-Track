class Domains::Companies::CompanyGenderStatsController < ApplicationController
  before_action :set_company_gender_stat, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy]

  # GET /company_gender_stats or /company_gender_stats.json
  def index
    @company_gender_stats = Domains::Companies::CompanyGenderStat.all
  end

  # GET /company_gender_stats/1 or /company_gender_stats/1.json
  def show
  end

  # GET /company_gender_stats/new
  def new
    @company_gender_stat = Domains::Companies::CompanyGenderStat.new
  end

  # GET /company_gender_stats/1/edit
  def edit
  end

  # POST /company_gender_stats or /company_gender_stats.json
  def create
    @company_gender_stat = Domains::Companies::CompanyGenderStat.new(company_gender_stat_params)

    respond_to do |format|
      if @company_gender_stat.save
        format.html { redirect_to @company_gender_stat, notice: "Company gender stat was successfully created." }
        format.json { render :show, status: :created, location: @company_gender_stat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company_gender_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_gender_stats/1 or /company_gender_stats/1.json
  def update
    respond_to do |format|
      if @company_gender_stat.update(company_gender_stat_params)
        format.html { redirect_to @company_gender_stat, notice: "Company gender stat was successfully updated." }
        format.json { render :show, status: :ok, location: @company_gender_stat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company_gender_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_gender_stats/1 or /company_gender_stats/1.json
  def destroy
    @company_gender_stat.destroy

    respond_to do |format|
      format.html do
 redirect_to domains_companies_company_gender_stats_path, status: :see_other, notice: "Company gender stat was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_gender_stat
      @company_gender_stat = Domains::Companies::CompanyGenderStat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_gender_stat_params
      params.require(:domains_companies_company_gender_stat).permit(:company_id, :gender_type_id, :employee_type_id, :count, :percentage)
    end
end
