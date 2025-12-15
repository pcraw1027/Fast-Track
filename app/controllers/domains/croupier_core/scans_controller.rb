class Domains::CroupierCore::ScansController < ApplicationController
  before_action :set_scan, only: %i[ edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy ]

  # GET /scans or /scans.json
  def index
    @scans = Domains::CroupierCore::Scan.includes(:user)
                                        .all.paginate(page: params[:page], per_page: 15).order(created_at: :desc, id: :desc)
  end

  # GET /scans/1 or /scans/1.json
  def show
    @scan = Domains::CroupierCore::Scan.includes(:user, :product).find(params[:id])
  end

  # GET /scans/new
  def new
    @scan = Domains::CroupierCore::Scan.new
  end

  # GET /scans/1/edit
  def edit
  end

  # POST /scans or /scans.json
  def create
    finder_claims = Domains::CroupierCore::Operations::ProductFinder.call!(barcode: scan_params[:barcode])
    if finder_claims.payload
      @scan = Domains::CroupierCore::Scan.create(user_id: current_user.id, product_id: finder_claims.payload.id, 
      scan_date: Time.zone.today, barcode: scan_params[:barcode], product_exists: true,
      lat: scan_params[:lat], lng: scan_params[:lng], address: scan_params[:address])
      Domains::CroupierCore::Operations::IncrPitCitProdCount.call!(barcode: scan_params[:barcode])
    else

      @scan = Domains::CroupierCore::Scan.create(user_id: current_user.id, 
      scan_date: Time.zone.today, barcode: scan_params[:barcode], product_exists: false,
      lat: scan_params[:lat], lng: scan_params[:lng], address: scan_params[:address])
        
      if @scan.id
            @brc_intrf_claims = Domains::CroupierCore::Operations::BarcodeInterface
                                .call!(barcode: scan_params[:barcode], 
              source: "Scan", asin: scan_params[:asin], user_id: current_user.id)
            if scan_params[:uploads].present?
              Domains::CroupierCore::Operations::UploadTrigger.call!(
                  barcode: scan_params[:barcode], 
                  scan_id: @scan.id, 
                  user_id: current_user.id, 
                  asin: scan_params[:asin],
                  brand: upload_record_params[:brand],
                  upload_params: scan_params[:uploads].except(:brand))
            end 
      end
      
    end
    respond_to do |format|
      if finder_claims.payload
        format.html { redirect_to finder_claims.payload, notice: "Scan was successfully created." }
        format.json { render :show, status: :created, location: @scan }
      elsif @brc_intrf_claims&.success?
        format.html { redirect_to @scan, notice:  "Scan was successfully created." }
        format.json { render :show, status: :created, location: @scan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scans/1 or /scans/1.json
  def update
    respond_to do |format|
      if @scan.update(scan_params)
        format.html { redirect_to @scan, notice: "Scan was successfully updated." }
        format.json { render :show, status: :ok, location: @scan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scans/1 or /scans/1.json
  def destroy
    @scan.destroy

    respond_to do |format|
      format.html { redirect_to domains_croupier_core_scans_path, status: :see_other, notice: "Scan was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private

    # Use callbacks to share common setup or constraints between actions.
    def set_scan
      @scan = Domains::CroupierCore::Scan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scan_params
      params.require(:domains_croupier_core_scan).permit(:barcode, :asin,
      :lat, :lng, :address,
       upload: [:product_name, :company_name, :brand, :remarks, 
       { media_attributes: [:id, :file, :media_type, :position, :_destroy] }])
    end
end

