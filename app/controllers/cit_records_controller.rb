class CitRecordsController < ApplicationController
  before_action :set_cit_record, only: %i[ show edit update destroy success_redirect company_capture_interface ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy cit_interface company_capture_interface]

  # GET /cit_records or /cit_records.json
  def index
    @cit_records = CitRecord.all
  end

  def success_redirect
  end

  def company_capture_interface
    @industry_category_type = IndustryCategoryType.new
    @company = Company.new
    if @cit_record.company_id 
      @company = @cit_record.company
    end
    @company.mid = @cit_record.mid
    @company.name = @cit_record.company_name

    if @company.industry_category_type_id 
      @industry_category_type = @company.industry_category_type
    end
    @company_contact = CompanyContact.new
    @industry_category_types = IndustryCategoryType.all
  end

  def cit_interface
    @cit_records_0s = CitRecord.by_level(0)
    @cit_records_1s = CitRecord.by_level(1)
    @cit_records_2s = CitRecord.by_level(2)
    @cit_records_3s = CitRecord.by_level(3)
    @cit_records_4s = CitRecord.by_level(4)
  end

  # GET /cit_records/1 or /cit_records/1.json
  def show
    @level_users = CitLevelUser.includes(:user).where(cit_record_id: params[:id])
  end

  # GET /cit_records/new
  def new
    @cit_record = CitRecord.new
  end

  # GET /cit_records/1/edit
  def edit
    @industry_category_type = IndustryCategoryType.new
    if @company.industry_category_type_id 
      @industry_category_type = @company.industry_category_type
    end
  end

  # POST /cit_records or /cit_records.json
  def create
    @cit_record = CitRecord.new(cit_record_params)
    respond_to do |format|
      if @cit_record.save
        format.html { redirect_to @cit_record, notice: "Cit record was successfully created." }
        format.json { render :show, status: :created, location: @cit_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cit_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cit_records/1 or /cit_records/1.json
  def update
    respond_to do |format|
      if @cit_record.update(cit_record_params)
        format.html { redirect_to @cit_record, notice: "Cit record was successfully updated." }
        format.json { render :show, status: :ok, location: @cit_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cit_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cit_records/1 or /cit_records/1.json
  def destroy
    @cit_record.destroy
    respond_to do |format|
      format.html { redirect_to cit_records_path, status: :see_other, notice: "Cit record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cit_record
      @cit_record = CitRecord.find(params[:id] || params[:cit_record_id])
    end

    # Only allow a list of trusted parameters through.
    def cit_record_params
      params.require(:cit_record).permit(:product_activity_count, :mid, :company_name, :level, :product_orphan_count, :source, :company_id)
    end
end
