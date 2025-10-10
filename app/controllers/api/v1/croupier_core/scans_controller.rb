class Api::V1::CroupierCore::ScansController < Api::V1::BaseController
  before_action :authenticate_user!

  def show
    scan = Domains::CroupierCore::Scan.includes(:product).find(params[:id])
    render json: {
      scan: scan,
                  product: scan.product
    }, status: :ok
  end

  def my_scans
    page = params[:page] || 1
    per_page = params[:per_page] || 20
    per_page = 20 if per_page.to_i > 20
    my_scan_products = Domains::CroupierCore::RawQueryModule.my_scan_products(per_page, page, current_user.id)
    render json: my_scan_products, status: :ok
  end


  def create
    finder_claims = Domains::CroupierCore::Operations::ProductFinder.call!(barcode: scan_params[:barcode])
    if finder_claims.payload
      @scan = Domains::CroupierCore::Scan.create!(user_id: current_user.id, product_id: finder_claims.payload.id, 
      scan_date: Time.zone.today, barcode: scan_params[:barcode], product_exists: true)
      Domains::CroupierCore::Operations::IncrPitCitProdCount.call!(barcode: scan_params[:barcode])
    else
      @scan = Domains::CroupierCore::Scan.create!(user_id: current_user.id, 
      scan_date: Time.zone.today, barcode: scan_params[:barcode], product_exists: false)
        
      if @scan.id
            @brc_intrf_claims = Domains::CroupierCore::Operations::BarcodeInterface.call!(barcode: scan_params[:barcode], 
                            source: "Scan", asin: scan_params[:asin], 
                            user_id: current_user.id, symbology: params[:scan][:symbology])
            if scan_params[:uploads].present?
              Domains::CroupierCore::Operations::UploadTrigger.call!(barcode: scan_params[:barcode], 
                  scan_id: @scan.id, 
                  user_id: current_user.id, 
                  asin: scan_params[:asin],
                  brand: upload_record_params[:brand],
                  upload_params: scan_params[:uploads].except(:brand),
                  symbology: params[:scan][:symbology])
            end 
      end
      
    end
  
      if finder_claims.payload
        render json: {
          product: finder_claims.payload,
        message: "Scan was successfully created."
        }, status: :ok
      elsif  @brc_intrf_claims&.success?
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
            upload: [:product_name, :company_name, :brand, 
                     :remarks, { media_attributes: [:id, :file, :media_type, :position, :_destroy] }]
    )
  end


end