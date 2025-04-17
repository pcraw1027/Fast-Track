class Api::V1::UploadRecordsController < Api::V1::BaseController
  before_action :authenticate_user!


  def create
    upload_claims = CroupierCore::UploadTrigger.call!(barcode: upload_record_params[:barcode], 
                              scan_id: upload_record_params[:scan_id], 
                              user_id: current_user.id, 
                              asin: upload_record_params[:asin],
                              upload_params: upload_record_params) unless upload_record_params.blank?
    
      if upload_claims.payload
        render json: upload_claims.payload, status: :ok
      else
        render json: upload_claims.error, status: :unprocessable_entity
      end

  end



  private


  def upload_record_params
<<<<<<< HEAD
    params.require(:upload_record).permit(:scan_id, :resolve_status, :date, :barcode, :product_name, 
                    :company_name, :remarks, :image, :asin, :brand)
=======
    params.require(:upload_record).permit(:scan_id, :resolve_status, :date, :barcode, :product_name, :company_name, :remarks, :image, :asin)
>>>>>>> f23b7e48ec63383043386d1601ad646396189564
  end


end