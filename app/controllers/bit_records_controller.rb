class BitRecordsController < ApplicationController
  before_action :set_bit_record, only: %i[ show edit update destroy ]
<<<<<<< HEAD
  before_action :authenticate_user!, only: %i[ new edit update create destroy ]
=======
>>>>>>> f23b7e48ec63383043386d1601ad646396189564

  # GET /bit_records or /bit_records.json
  def index
    @bit_records = BitRecord.all
  end

  # GET /bit_records/1 or /bit_records/1.json
  def show
  end

  # GET /bit_records/new
  def new
    @bit_record = BitRecord.new
  end

  # GET /bit_records/1/edit
  def edit
  end

  # POST /bit_records or /bit_records.json
  def create
    @bit_record = BitRecord.new(bit_record_params)
<<<<<<< HEAD
    @bit_record.user_id = current_user.id
=======

>>>>>>> f23b7e48ec63383043386d1601ad646396189564
    respond_to do |format|
      if @bit_record.save
        format.html { redirect_to @bit_record, notice: "Bit record was successfully created." }
        format.json { render :show, status: :created, location: @bit_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bit_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bit_records/1 or /bit_records/1.json
  def update
    respond_to do |format|
      if @bit_record.update(bit_record_params)
        format.html { redirect_to @bit_record, notice: "Bit record was successfully updated." }
        format.json { render :show, status: :ok, location: @bit_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bit_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bit_records/1 or /bit_records/1.json
  def destroy
    @bit_record.destroy

    respond_to do |format|
      format.html { redirect_to bit_records_path, status: :see_other, notice: "Bit record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bit_record
      @bit_record = BitRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bit_record_params
      params.require(:bit_record).permit(:barcode, :status, :source)
    end
end
