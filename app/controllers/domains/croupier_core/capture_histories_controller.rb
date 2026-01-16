class Domains::CroupierCore::CaptureHistoriesController < ApplicationController
  before_action :set_capture_history, only: %i[ show edit update destroy ]

  # GET /capture_histories or /capture_histories.json
  def index
    @capture_histories = Domains::CroupierCore::CaptureHistory.all.paginate(page: params[:page], per_page: 15).order(created_at: :desc, id: :desc)
  end


  # GET /capture_histories/1 or /capture_histories/1.json
  def show
  end

  # GET /capture_histories/new
  def new
    @capture_history = Domains::CroupierCore::CaptureHistory.new
  end

  # GET /capture_histories/1/edit
  def edit
  end

  # POST /capture_histories or /capture_histories.json
  def create
    @capture_history = Domains::CroupierCore::CaptureHistory.new(capture_history_params)

    respond_to do |format|
      if @capture_history.save
        format.html { redirect_to @capture_history, notice: "Capture history was successfully created." }
        format.json { render :show, status: :created, location: @capture_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @capture_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /capture_histories/1 or /capture_histories/1.json
  def update
    respond_to do |format|
      if @capture_history.update(capture_history_params)
        format.html { redirect_to @capture_history, notice: "Capture history was successfully updated." }
        format.json { render :show, status: :ok, location: @capture_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @capture_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capture_histories/1 or /capture_histories/1.json
  def destroy
    @capture_history.destroy

    respond_to do |format|
      format.html { redirect_to capture_histories_path, status: :see_other, notice: "Capture history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capture_history
      @capture_history = Domains::CroupierCore::CaptureHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def capture_history_params
      params.require(:domains_croupier_core_capture_history).permit(:third_party_source, :status, :barcode, :name)
    end
end
