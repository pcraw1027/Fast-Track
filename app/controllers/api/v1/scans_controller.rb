class Api::V1::ScansController < Api::V1::BaseController
  before_action :authenticate_user!


  def create
    finder_claims = CroupierCore::ProductFinder.call!(barcode: scan_params[:barcode])
    if finder_claims.payload
      @scan = Scan.create(user_id: current_user.id, product_id: scan_params[:product_id], 
      scan_date: Date.today, barcode: scan_params[:barcode], product_exists: true)
      CroupierCore::IncrPitCitProdCount.call!(barcode: scan_params[:barcode])
    else
    
      @scan = Scan.create(user_id: current_user.id, product_id: scan_params[:product_id], 
      scan_date: Date.today, barcode: scan_params[:barcode], product_exists: false)
        
      if @scan.id
            @brc_intrf_claims = CroupierCore::BarcodeInterface.call!(barcode: scan_params[:barcode], 
<<<<<<< HEAD
                            source: "Scan", asin: scan_params[:asin], user_id: current_user.id)
=======
                                                    source: "Scan", asin: scan_params[:asin])
>>>>>>> f23b7e48ec63383043386d1601ad646396189564
            CroupierCore::UploadTrigger.call!(barcode: scan_params[:barcode], 
                scan_id: @scan.id, 
                user_id: current_user.id, 
                asin: scan_params[:asin],
                upload_params: scan_params[:uploads]) unless scan_params[:uploads].blank? 

      end
      
    end
  
      if finder_claims.payload
        render json: {
          product: finder_claims.payload,
          company: finder_claims.payload.company,
        message: "Scan was successfully created."
      }, status: :ok
      elsif  @brc_intrf_claims && @brc_intrf_claims.success?
        render json: {
          scan: @scan,
        message: @brc_intrf_claims.payload
      }, status: :ok
      else
        render json: @scan.errors, status: :unprocessable_entity

      end

  end


  private


  # Only allow a list of trusted parameters through.
  def scan_params
    params.require(:scan).permit(
            :barcode, :asin,
<<<<<<< HEAD
            uploads: [:product_name, :company_name, :brand, :remarks, :image])
=======
            uploads: [:product_name, :company_name, :remarks, :image])
>>>>>>> f23b7e48ec63383043386d1601ad646396189564
  end


end