class Api::V1::ScansController < Api::V1::BaseController
  before_action :authenticate_user!


  def my_scans
    page = params[:page] || 1
    per_page = params[:per_page] || 20
    per_page = 20 if per_page.to_i > 20
    my_scan_products = RawQueryModule.my_scan_products(per_page, page, current_user.id)
    render json: my_scan_products, status: :ok
  end


  def create
    finder_claims = CroupierCore::ProductFinder.call!(barcode: scan_params[:barcode])
    if finder_claims.payload
      @scan = Scan.create!(user_id: current_user.id, product_id: finder_claims.payload.id, 
      scan_date: Date.today, barcode: scan_params[:barcode], product_exists: true)
      CroupierCore::IncrPitCitProdCount.call!(barcode: scan_params[:barcode])
    else
      @scan = Scan.create!(user_id: current_user.id, 
      scan_date: Date.today, barcode: scan_params[:barcode], product_exists: false)
        
      if @scan.id
            @brc_intrf_claims = CroupierCore::BarcodeInterface.call!(barcode: scan_params[:barcode], 
                            source: "Scan", asin: scan_params[:asin], user_id: current_user.id)
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
          product_variants: finder_claims.payload.product_variants,
          company: finder_claims.payload.company,
        message: "Scan was successfully created."
      }, status: :ok
      elsif  @brc_intrf_claims && @brc_intrf_claims.success?
        render json: {
          scan: @scan,
        message: @brc_intrf_claims.payload[:message]
      }, status: :ok
      else
        render json: @scan.errors, status: :unprocessable_entity

      end

  end


  private


  def scan_params
    params.require(:scan).permit(
            :barcode, :asin,
            uploads: [:product_name, :company_name, :brand, :remarks, :image])
  end


end