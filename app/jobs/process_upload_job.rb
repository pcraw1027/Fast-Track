class ProcessUploadJob < ApplicationJob
  queue_as :default

  def perform(upload_record_params, current_user_id, symbology)

    upload_claims = CroupierCore::UploadTrigger.call!(
                              barcode: upload_record_params[:barcode], 
                              scan_id: upload_record_params[:scan_id], 
                              user_id: current_user_id, 
                              asin: upload_record_params[:asin],
                              brand: upload_record_params[:brand],
                              upload_params: upload_record_params.except(:brand),
                              symbology: symbology
                              ) unless upload_record_params.blank?

    Rails.logger.info "Upload Job: #{upload_claims.payload.inspect} processed"
  end
end
