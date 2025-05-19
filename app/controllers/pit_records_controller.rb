class PitRecordsController < ApplicationController
  before_action :set_pit_record, only: %i[ show edit update destroy success_redirect product_capture_interface ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy pit_interface product_capture_interface]


  # GET /pit_records or /pit_records.json
  def index
    @pit_records = PitRecord.all
  end

  def success_redirect
  end

  def product_capture_interface
    @product = Product.new
    @product.barcode = @pit_record.barcode
    product_variant = ProductVariant.new
    product_variant.media.build
    @product.media = product_variant.media
    if @pit_record.product_id
      @product = @pit_record.product
      variants = ProductVariant.find_by(barcode: @pit_record.barcode)
      if variants
        @product.barcode = variants.barcode
        @product.media = variants.media
      end      
    end
    
    @product_category_sources = ProductCategorySource.all
    product_category_source_id = @product_category_sources.find{|p| p.code == 'AMZ'}&.id 
    @product.product_category_source_id = product_category_source_id
    @segments = Segment.where(product_category_source_id: product_category_source_id)



  end

  def pit_interface
    @pit_records_0s = PitRecord.by_level(0)
    @pit_records_1s = PitRecord.by_level(1)
    @pit_records_2s = PitRecord.by_level(2)
    @pit_records_3s = PitRecord.by_level(3)
    @pit_records_4s = PitRecord.by_level(4)
    @pit_records_5s = PitRecord.by_level(5)
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
