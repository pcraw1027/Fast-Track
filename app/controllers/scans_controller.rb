class ScansController < ApplicationController
  before_action :set_scan, only: %i[ edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy ]

  # GET /scans or /scans.json
  def index
    @scans = Scan.includes(:user).all.paginate(page: params[:page], per_page: 20).order(created_at: :desc, id: :desc)
  end

  # GET /scans/1 or /scans/1.json
  def show
    @scan = Scan.includes(:user, :product).find(params[:id])
  end

  # GET /scans/new
  def new
    @scan = Scan.new
  end

  # GET /scans/1/edit
  def edit
  end

  # POST /scans or /scans.json
  def create
    finder_claims = CroupierCore::ProductFinder.call!(barcode: scan_params[:barcode])
    if finder_claims.payload
      @scan = Scan.create(user_id: current_user.id, product_id: finder_claims.payload.id, 
      scan_date: Time.zone.today, barcode: scan_params[:barcode], product_exists: true)
      CroupierCore::IncrPitCitProdCount.call!(barcode: scan_params[:barcode])
    else
    
      @scan = Scan.create(user_id: current_user.id, 
      scan_date: Time.zone.today, barcode: scan_params[:barcode], product_exists: false)
        
      if @scan.id
            @brc_intrf_claims = CroupierCore::BarcodeInterface.call!(barcode: scan_params[:barcode], 
                                    source: "Scan", asin: scan_params[:asin], user_id: current_user.id)
            CroupierCore::UploadTrigger.call!(barcode: scan_params[:barcode], 
                scan_id: @scan.id, 
                user_id: current_user.id, 
                asin: scan_params[:asin],
                brand: upload_record_params[:brand],
                upload_params: scan_params[:uploads].except(:brand)) if scan_params[:uploads].present? 

      end
      
    end
    respond_to do |format|
      if finder_claims.payload
        format.html { redirect_to finder_claims.payload, notice: "Scan was successfully created." }
        format.json { render :show, status: :created, location: @scan }
      elsif @brc_intrf_claims && @brc_intrf_claims.success?
        format.html { redirect_to @scan, notice:  "Scan was successfully created."}
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
      format.html { redirect_to scans_path, status: :see_other, notice: "Scan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scan
      @scan = Scan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scan_params
      params.require(:scan).permit(:barcode, :asin, upload: [:product_name, :company_name, :brand, 
      :remarks, media_attributes: [:id, :file, :media_type, :position, :_destroy]])
    end
end

