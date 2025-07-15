class UploadRecordsController < ApplicationController
  before_action :set_upload_record, only: %i[ edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy ]

  # GET /upload_records or /upload_records.json
  def index
    @upload_records = UploadRecord.includes(:user, :scan).all.paginate(page: params[:page], per_page: 12).order(created_at: :desc, id: :desc)
  end

  # GET /upload_records/1 or /upload_records/1.json
  def show
    @upload_record = UploadRecord.includes(:user, :scan).find(params[:id])
  end

  # GET /upload_records/new
  def new
    @upload_record = UploadRecord.new
  end

  # GET /upload_records/1/edit
  def edit
  end

  # POST /upload_records or /upload_records.json
  def create
    upload_claims = CroupierCore::UploadTrigger.call!(barcode: upload_record_params[:barcode], 
                              scan_id: upload_record_params[:scan_id], 
                              user_id: current_user.id, 
                              asin: upload_record_params[:asin],
                              brand: upload_record_params[:brand],
                              upload_params: upload_record_params.except(:brand)) unless upload_record_params.blank?
    

    respond_to do |format|
      if upload_claims.payload
        format.html { redirect_to upload_claims.payload, notice: "Upload record was successfully created." }
        format.json { render :show, status: :created, location: upload_claims }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: upload_claims.error, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upload_records/1 or /upload_records/1.json
  def update
    respond_to do |format|
      if @upload_record.update(upload_record_params)
        format.html { redirect_to @upload_record, notice: "Upload record was successfully updated." }
        format.json { render :show, status: :ok, location: @upload_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @upload_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upload_records/1 or /upload_records/1.json
  def destroy
    @upload_record.destroy

    respond_to do |format|
      format.html { redirect_to upload_records_path, status: :see_other, notice: "Upload record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload_record
      @upload_record = UploadRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def upload_record_params
      params.require(:upload_record).permit(:scan_id, :asin, :resolve_status, :date, :barcode, 
      :product_name, :company_name, :brand, :remarks, media_attributes: [:id, :file, :media_type, :position, :_destroy])
    end
end
