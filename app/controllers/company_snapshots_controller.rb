class CompanySnapshotsController < ApplicationController
  before_action :set_company_snapshot, only: %i[ show edit update destroy ]

  # GET /company_snapshots or /company_snapshots.json
  def index
    @company_snapshots = CompanySnapshot.all
  end

  # GET /company_snapshots/1 or /company_snapshots/1.json
  def show
  end

  # GET /company_snapshots/new
  def new
    @company_snapshot = CompanySnapshot.new
  end

  # GET /company_snapshots/1/edit
  def edit
  end

  # POST /company_snapshots or /company_snapshots.json
  def create
    @company_snapshot = CompanySnapshot.new(company_snapshot_params)

    respond_to do |format|
      if @company_snapshot.save
        format.html { redirect_to @company_snapshot, notice: "Company snapshot was successfully created." }
        format.json { render :show, status: :created, location: @company_snapshot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company_snapshot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_snapshots/1 or /company_snapshots/1.json
  def update
    respond_to do |format|
      if @company_snapshot.update(company_snapshot_params)
        format.html { redirect_to @company_snapshot, notice: "Company snapshot was successfully updated." }
        format.json { render :show, status: :ok, location: @company_snapshot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company_snapshot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_snapshots/1 or /company_snapshots/1.json
  def destroy
    @company_snapshot.destroy

    respond_to do |format|
      format.html { redirect_to company_snapshots_path, status: :see_other, notice: "Company snapshot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_snapshot
      @company_snapshot = CompanySnapshot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_snapshot_params
      params.require(:company_snapshot).permit(:company_id, :data_transparency, :internal_culture, :mgmt_composition)
    end
end
