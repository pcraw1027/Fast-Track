class Api::V1::UploadRecordsController < Api::V1::BaseController
  before_action :authenticate_user!

  def my_uploads 
    page = params[:page] || 1
    per_page = params[:per_page] || 20
    per_page = 20 if per_page.to_i > 20
    user_uploads = UploadRecord.user_uploads(page, per_page, current_user.id)
    render json: user_uploads, status: :ok
  end

  def create
    ProcessUploadJob.perform_later(upload_record_params, current_user.id, params[:upload_record][:symbology])

    if upload_record_params.blank?
      render json: {message: "No upload record parameters provided"}, status: :unprocessable_entity
    else
      render json: {message: "Upload record created successfully"}, status: :ok

    end

  end



  private



  def upload_record_params
    params.require(:upload_record).permit(:scan_id, :resolve_status, :date, :barcode, :product_name, 
                              :company_name, :remarks, :asin, :brand,  
                              media_attributes: [:id, :file, :media_type, :position, :_destroy])
  end


end