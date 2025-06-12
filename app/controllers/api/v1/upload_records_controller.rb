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
    upload_claims = CroupierCore::UploadTrigger.call!(barcode: upload_record_params[:barcode], 
                              scan_id: upload_record_params[:scan_id], 
                              user_id: current_user.id, 
                              asin: upload_record_params[:asin],
                              brand: upload_record_params[:brand],
                              upload_params: upload_record_params.except(:brand)) unless upload_record_params.blank?
    
    if upload_claims.payload
      render json: {upload: upload_claims.payload, media: upload_claims.payload.media}, status: :ok
    else
      render json: upload_claims.error, status: :unprocessable_entity
    end

  end



  private



  def upload_record_params
    params.require(:upload_record).permit(:scan_id, :resolve_status, :date, :barcode, :product_name, 
                              :company_name, :remarks, :asin, :brand,  
                              media_attributes: [:id, :file, :media_type, :position, :_destroy])
  end


end