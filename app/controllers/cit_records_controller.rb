class CitRecordsController < ApplicationController
  before_action :set_cit_record, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy cit_interface]

  # GET /cit_records or /cit_records.json
  def index
    @cit_records = CitRecord.all
  end

  def next_cit_record
    cit_record = CitRecord.where(level: params[:level])
                          .order(product_activity_count: :desc)
                          .limit(1).first
    if cit_record
      redirect_to(company_capture_interface_path(mid: cit_record.mid, level: params[:level]))
    else
      redirect_to(cit_interface_path(), alert: "No more CIT Level #{params[:level]} records!")
    end
  end

  def company_capture
    @industry_category_type = IndustryCategoryType.new
    @company = Company.new
    @cit_record = CitRecord.new
    @company_contact = CompanyContact.new
   
    if params[:mid]
      @cit_record = CitRecord.find_by(mid: params[:mid].strip)
      if @cit_record
        @company = Company.find(@cit_record.company_id) if @cit_record.company_id
        @company.mid = @cit_record.mid
        @industry_category_type = @company.industry_category_type if @company.industry_category_type_id 
      else
        @cit_record = CitRecord.new
        flash[:message] = "Cit Record with barcode not found"
      end
    elsif params[:company_id]
      @company = Company.find(params[:company_id])
      @company.mid = "saved!"
      @industry_category_type = @company.industry_category_type if @company.industry_category_type_id
      
    end

    if @company.company_contacts.blank?
      contact = @company.company_contacts.build
      contact.build_person
    else
      @company.company_contacts.each do |contact|
        contact.build_person if contact.person.blank?
      end
    end

    @gender_types = GenderType.all
    @ethinicity_types = EthnicityType.all
    @country_references = CountryReference.all
    @address_types = AddressType.all
    @company_contact_types = CompanyContactType.all
    @company_relationship_types = CompanyRelationshipType.all

  end


  def cit_interface
    cits = CitRecord.includes(:company, :cit_level_users)
    @cit_records_0s = []
    @cit_records_1s = []
    @cit_records_2s = []
    @cit_records_3s = []
    @cit_records_4s = []

    cits.each do |cit|
      if !cit.company&.level_1_flag || cit.company_id.blank?
        @cit_records_0s.push(cit) 
      elsif !cit.company&.level_2_flag 
        @cit_records_1s.push(cit) 
      elsif !cit.company&.level_3_flag 
        @cit_records_2s.push(cit) 
      elsif !cit.company&.level_4_flag
         @cit_records_3s.push(cit) 
      elsif !cit.company&.level_5_flag 
        @cit_records_4s.push(cit) 
      end
    end
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
