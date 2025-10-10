class Domains::CroupierCore::BitRecordsController < ApplicationController
  before_action :set_bit_record, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy bit_interface insert_barcode]

  # GET /bit_records or /bit_records.json
  def index
    @bit_records = Domains::CroupierCore::BitRecord.all.paginate(page: params[:page], per_page: 20).order(created_at: :desc, id: :desc)
  end

  # GET /bit_records/1 or /bit_records/1.json
  def show
  end

  # GET /bit_records/new
  def new
    @bit_record = Domains::CroupierCore::BitRecord.new
  end

   # GET /bit_interface
   def bit_interface
    @bit_record = Domains::CroupierCore::BitRecord.new
    @bit_records = Domains::CroupierCore::BitRecord.where(user_id: current_user.id)
  end

  # POST /insert_barcode
  def insert_barcode
    begin
      if bit_record_params[:barcode].present?
        @brc_intrf_claims = Domains::CroupierCore::Operations::BarcodeInterface.call!(barcode: bit_record_params[:barcode].strip, 
                                      source: "BIT Load", asin: nil, user_id: current_user.id)
        if @brc_intrf_claims&.success?
          render json: {bit_records: [@brc_intrf_claims.payload], error:""}
        else
          render json: {bit_records: [], error: @brc_intrf_claims.error}
        end
      elsif bit_record_load_params[:file].present?
        bit_records = Domains::CroupierCore::BitRecord.load_from_file(bit_record_load_params[:file].tempfile, current_user.id)
        render json: {bit_records: bit_records, error: ""}
      end
    rescue => e
      render json: {bit_records: [], error: e.message}
    end
  end

  # GET /bit_records/1/edit
  def edit
  end

  # POST /bit_records or /bit_records.json
  def create
    @bit_record = Domains::CroupierCore::BitRecord.new(bit_record_params)
    @bit_record.user_id = current_user.id
    respond_to do |format|
      if @bit_record.save
        format.html { redirect_to @bit_record, notice: "Bit record was successfully created." }
        format.json { render :show, status: :created, location: @bit_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bit_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bit_records/1 or /bit_records/1.json
  def update
    respond_to do |format|
      if @bit_record.update(bit_record_params)
        format.html { redirect_to @bit_record, notice: "Bit record was successfully updated." }
        format.json { render :show, status: :ok, location: @bit_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bit_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bit_records/1 or /bit_records/1.json
  def destroy
    @bit_record.destroy

    respond_to do |format|
      format.html { redirect_to domains_croupier_core_bit_records_path, status: :see_other, notice: "Bit record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bit_record
      @bit_record = Domains::CroupierCore::BitRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bit_record_params
      params.require(:domains_croupier_core_bit_record).permit(:barcode, :status, :source)
    end
    def bit_record_load_params
      params.require(:domains_croupier_core_bit_record).permit(:file)
    end
end
