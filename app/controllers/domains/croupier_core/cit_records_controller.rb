class Domains::CroupierCore::CitRecordsController < ApplicationController
  before_action :set_cit_record, only: %i[ edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy cit_interface]

  # GET /cit_records or /cit_records.json
  def index
    @cit_records = Domains::CroupierCore::CitRecord.includes(:company).all
    .paginate(page: params[:page], per_page: 20).order(
      created_at: :desc, id: :desc
    )
  end

  def next_cit_record
    classify_cit_records
    cits = []
    case (params[:level].to_i - 1)
    when 0
      cits = @cit_records_0s
    when 1
      cits = @cit_records_1s
    when 2
      cits = @cit_records_2s
    when 3
      cits = @cit_records_3s
    when 4
      cits = @cit_records_4s
    else
      cits = @cit_records_0s
    end

    cit_record = nil

    if params[:previous_rec_id]
      index = cits.index { |cit_rec| cit_rec.id == params[:previous_rec_id].to_i }
      if index && cits.length > index + 1
        cit_record = cits[index + 1]
      elsif index
        cit_record = cits[index]
      else
        cit_record = cits[0]
      end
    else
      cit_record = cits[0]
    end

    if cit_record
      redirect_to(company_capture_interface_path(mid: cit_record.mid, level: params[:level], 
filter_by: params[:filter_by]))
    else
      redirect_to(cit_interface_path(), alert: "No more CIT Level #{params[:level]} records!")
    end
  end

  def company_capture
    @industry_category_type = Domains::Companies::IndustryCategoryType.new
    @company = Domains::Companies::Company.new
    @cit_record = Domains::CroupierCore::CitRecord.new
    @company_contact = Domains::Companies::CompanyContact.new


    if params[:mid]
      @cit_record = Domains::CroupierCore::CitRecord.find_by(mid: params[:mid].strip)
      if @cit_record
        @company = Domains::Companies::Company.find(@cit_record.company_id) if @cit_record.company_id
        @company.mid = @cit_record.mid
        @industry_category_type = @company.industry_category_type if @company.industry_category_type_id 
      else
        @cit_record = Domains::CroupierCore::CitRecord.new
        flash[:message] = "Cit Record with barcode not found"
      end
    elsif params[:company_id]
      @company = Domains::Companies::Company.includes(:cit_records).find(params[:company_id])
      @company.mid = "saved!"
      @industry_category_type = @company.industry_category_type if @company.industry_category_type_id
      @cit_record = @company.cit_records.first if @company.cit_records.any?
    end

    contact = @company.company_contacts.build if @company.company_contacts.blank?

    @gender_types = Domains::People::GenderType.all
    @ethinicity_types = Domains::People::EthnicityType.all
    @country_references = Domains::ContactAndIdentity::CountryReference.all
    @address_types = Domains::ContactAndIdentity::AddressType.all
    @company_contact_types = Domains::Companies::CompanyContactType.all
    @company_relationship_types = Domains::Companies::CompanyRelationshipType.all
    parent_sub = @company_relationship_types.find{|r| r.relationship == "Parent/Brand"}
    filtered = @company_relationship_types.select{|r| r.relationship != "Parent/Brand"}
    filtered.unshift(parent_sub)
    @company_relationship_types_subsidiaries = filtered

  end



  def cit_interface
    classify_cit_records
  end

  # GET /cit_records/1 or /cit_records/1.json
  def show
    @cit_record = Domains::CroupierCore::CitRecord.includes(:company, :cit_level_users).find(params[:id])
    @level_users = @cit_record.cit_level_users
  end

  # GET /cit_records/new
  def new
    @cit_record = Domains::CroupierCore::CitRecord.new
  end

  # GET /cit_records/1/edit
  def edit
  end

  # POST /cit_records or /cit_records.json
  def create
    @cit_record = Domains::CroupierCore::CitRecord.new(cit_record_params)
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
      format.html { redirect_to domains_croupier_core_cit_records_path, status: :see_other, notice: "Cit record was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private


  def classify_cit_records
      cits = []
    if params[:filter_by] == "parent"
      cits = Domains::CroupierCore::CitRecord.for_parent_companies
    elsif params[:filter_by] == "subsidiary"
      cits = Domains::CroupierCore::CitRecord.for_child_only_companies
    elsif params[:filter_by] == "all"
      cits = Domains::CroupierCore::CitRecord.with_company_and_level_users
    else
      cits = Domains::CroupierCore::CitRecord.for_companies_with_products
    end
    
    @cit_records_0s = []
    @cit_records_1s = []
    @cit_records_2s = []
    @cit_records_3s = []
    @cit_records_4s = []

    cits.each do |cit|
        @cit_records_0s.push(cit) if !cit.company&.level_1_flag || cit.company_id.blank?
        @cit_records_1s.push(cit) if !cit.company&.level_2_flag && cit.company&.level_1_flag
        @cit_records_2s.push(cit) if !cit.company&.level_3_flag && cit.company&.level_1_flag
        @cit_records_3s.push(cit) if !cit.company&.level_4_flag && cit.company&.level_1_flag
        @cit_records_4s.push(cit) if !cit.company&.level_5_flag && cit.company&.level_1_flag
    end
    
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_cit_record
      @cit_record = Domains::CroupierCore::CitRecord.find(params[:id] || params[:cit_record_id])
    end

    # Only allow a list of trusted parameters through.
    def cit_record_params
      params.require(:domains_croupier_core_cit_record).permit(:product_activity_count, :mid, :level, 
      :product_orphan_count, :source, :company_id)
    end
end
