class PitRecordsController < ApplicationController
  before_action :set_pit_record, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy pit_interface product_capture_interface invoke_bit_pit_triggers]

  # GET /pit_records or /pit_records.json
  def index
    @pit_records = PitRecord.all
  end

  def next_pit_record
    pit_record = PitRecord.where(level: params[:level])
                          .order(product_activity_count: :desc)
                          .limit(1).first
    if pit_record
        redirect_to(product_capture_interface_path(barcode: pit_record.barcode, level: params[:level]))
      else
        redirect_to(pit_interface_path(), alert: "No more PIT Level #{params[:level]} records!")
      end
  end

  def invoke_bit_pit_triggers
    if (pit_record_params[:barcode].strip.length < 12 || pit_record_params[:barcode].strip.length > 13)
      redirect_to(product_capture_interface_path(barcode: pit_record_params[:barcode].strip), alert: "supported barcodes are between 12 and 13 digits") and return 
    end
    @pit_record = PitRecord.find_by(barcode: pit_record_params[:barcode].strip)
    if @pit_record
      redirect_to(product_capture_interface_path(barcode: pit_record_params[:barcode].strip, level: @pit_record.level), alert: "Barcode already exists. Please enter New Product information.")
    else
      @brc_intrf_claims = CroupierCore::BarcodeInterface.call!(barcode: pit_record_params[:barcode].strip, 
                                        source: "PIT Capture", asin: nil, user_id: current_user.id)
      if @brc_intrf_claims&.success?
        redirect_to(product_capture_interface_path(barcode: pit_record_params[:barcode].strip), notice: (@brc_intrf_claims.payload[:message] + " - Please enter New Product Information."))
      else
        redirect_to(product_capture_interface_path(barcode: pit_record_params[:barcode].strip), alert: @brc_intrf_claims.error.message)
      end
    end
  end

  def product_capture
    @pit_record = PitRecord.new
    @company = Company.new
    @product = Product.new

    @segment = Segment.new
    @family = Family.new
    @klass = Klass.new
    @brick = Brick.new
    @company_name = ''
    company_added = false

    @segments = []

    if params[:barcode]
      @pit_record = PitRecord.find_by(barcode: params[:barcode].strip)

      if @pit_record
        product_category_sources = ProductCategorySource.all
        product_category_source_id = product_category_sources.find{|p| p.code == 'AMZ'}&.id 
        @product.product_category_source_id = product_category_source_id
        @segments = Segment.where(product_category_source_id: product_category_source_id)
        product_variant = ProductVariant.new
        product_variant.media.build
        @product.media = product_variant.media
        if @pit_record&.product_id
             
          @product = @pit_record.product
          company_added = true if @product.company_id
          @product.product_category_source_id = product_category_source_id
          @segment = Segment.find(@product.segment_id) if @product.segment_id 
          @family = Family.find(@product.family_id) if @product.family_id
          @klass = Klass.find(@product.klass_id) if @product.klass_id
          @brick = Brick.find(@product.brick_id) if @product.brick_id

          @product.asin = @pit_record.asin if @pit_record.asin
          @company = Company.find(@product.company_id) if @product.company_id
          @product.product_category_source_id = product_category_source_id
          variants = ProductVariant.find_by(barcode: @pit_record.barcode)
          if variants
            @product.barcode = variants.barcode
            variants.media.build
            @product.media = variants.media
          end 
          unless company_added
            mid = CroupierCore::MidExtractor.call!(barcode: params[:barcode].strip).payload
            cit_rec = CitRecord.find_by(mid: mid)
            @company_name = cit_rec&.company_name
          end     
        end
      else
        @pit_record = PitRecord.new
        flash[:message] = "Pit Record with barcode not found"
      end

    end
  end

  def pit_interface
    pits = PitRecord.includes(:product, :pit_level_users)
    @pit_records_0s = []
    @pit_records_1s = []
    @pit_records_2s = []
    @pit_records_3s = []
    @pit_records_4s = []

    pits.each do |pit|
      @pit_records_0s.push(pit) if !pit.product&.level_1_flag || pit.product_id.blank?
      @pit_records_1s.push(pit) if !pit.product&.level_2_flag && pit.product&.level_1_flag
      @pit_records_2s.push(pit) if !pit.product&.level_3_flag && pit.product&.level_1_flag
      @pit_records_3s.push(pit) if !pit.product&.level_4_flag && pit.product&.level_1_flag
      @pit_records_4s.push(pit) if !pit.product&.level_5_flag && pit.product&.level_1_flag
    end

  end

  # GET /pit_records/1 or /pit_records/1.json
  def show
    @level_users = PitLevelUser.includes(:user).where(pit_record_id: params[:id])
  end
  
  # GET /pit_records/new
  def new
    @pit_record = PitRecord.new
  end

  # GET /pit_records/1/edit
  def edit
  end

  # POST /pit_records or /pit_records.json
  def create
    @pit_record = PitRecord.new(pit_record_params)

    respond_to do |format|
      if @pit_record.save
        format.html { redirect_to @pit_record, notice: "Pit record was successfully created." }
        format.json { render :show, status: :created, location: @pit_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pit_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pit_records/1 or /pit_records/1.json
  def update
    respond_to do |format|
      if @pit_record.update(pit_record_params)
        format.html { redirect_to @pit_record, notice: "Pit record was successfully updated." }
        format.json { render :show, status: :ok, location: @pit_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pit_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pit_records/1 or /pit_records/1.json
  def destroy
    @pit_record.destroy

    respond_to do |format|
      format.html { redirect_to pit_records_path, status: :see_other, notice: "Pit record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pit_record
      @pit_record = PitRecord.find(params[:id] || params[:pit_record_id])
    end

    # Only allow a list of trusted parameters through.
    def pit_record_params
      params.require(:pit_record).permit(:product_activity_count, :barcode, :asin, :level, :source, :product_id, :mid)
    end
end
