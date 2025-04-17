class UploadRecordsController < ApplicationController
  before_action :set_upload_record, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy ]

  # GET /upload_records or /upload_records.json
  def index
    @upload_records = UploadRecord.all
  end

  # GET /upload_records/1 or /upload_records/1.json
  def show
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
                              upload_params: upload_record_params) unless upload_record_params.blank?
    


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
<<<<<<< HEAD
      :product_name, :company_name, :brand, :remarks, :image)
=======
      :product_name, :company_name, :remarks, :image)
>>>>>>> f23b7e48ec63383043386d1601ad646396189564
    end
end
