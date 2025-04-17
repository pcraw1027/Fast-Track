class PitRecordsController < ApplicationController
  before_action :set_pit_record, only: %i[ show edit update destroy ]

  # GET /pit_records or /pit_records.json
  def index
    @pit_records = PitRecord.all
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
      @pit_record = PitRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pit_record_params
      params.require(:pit_record).permit(:product_activity_count, :barcode, :asin, :level, :source, :product_id, :mid)
    end
end
