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
      scan_date: Time.zone.today, barcode: scan_params[:barcode], product_exists: true,
      lat: scan_params[:lat], lng: scan_params[:lng], address: scan_params[:address])
      Domains::CroupierCore::Operations::IncrPitCitProdCount.call!(barcode: scan_params[:barcode])
    else
      @scan = Domains::CroupierCore::Scan.create!(user_id: current_user.id, 
      scan_date: Time.zone.today, barcode: scan_params[:barcode], product_exists: false,
      lat: scan_params[:lat], lng: scan_params[:lng], address: scan_params[:address]
      )
        
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
        save_to_list(product_id: finder_claims.payload.id)
        render json: {
          product: finder_claims.payload,
        message: "Scan was successfully created."
        }, status: :ok
      elsif  @brc_intrf_claims&.success?
        save_to_list(product_id: nil)
        render json: {
          scan: @scan,
        message: @brc_intrf_claims.payload[:message]
        }, status: :ok
      else
        render json: @scan.errors, status: :unprocessable_entity

      end
  end


  private


  def save_to_list(product_id: nil)
    if params[:scan][:scan_to_list_mode] || current_user.scan_to_list_mode
      unless product_id.blank?
          Domains::Users::ListRoutine.new(user_id: current_user.id,
                  list_id: params[:scan][:list_id]).add_list_resource(
                    barcode: scan_params[:barcode], 
                    resource_type: "Domains::Products::Product", resource_id: product_id
                  )
      else
          Domains::Users::ListRoutine.new(user_id: current_user.id,
                  list_id: params[:scan][:list_id]).add_list_resource(
                    barcode: scan_params[:barcode])
      end
    end
  end

  def scan_params
    params.require(:scan).permit(
      :barcode, :asin, :lat, :lng, :address,
            upload: [:product_name, :company_name, :brand, 
            :remarks, { media_attributes: [:id, :file, :media_type, :position, :_destroy] }]
    )
  end


end