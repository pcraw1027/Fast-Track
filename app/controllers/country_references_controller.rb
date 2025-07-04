class CountryReferencesController < ApplicationController
  before_action :set_country_reference, only: %i[ show edit update destroy ]

  # GET /country_references or /country_references.json
  def index
    @country_references = CountryReference.all
  end

  # GET /country_references/1 or /country_references/1.json
  def show
  end

  # GET /country_references/new
  def new
    @country_reference = CountryReference.new
  end

  # GET /country_references/1/edit
  def edit
  end

  # POST /country_references or /country_references.json
  def create
    @country_reference = CountryReference.new(country_reference_params)

    respond_to do |format|
      if @country_reference.save
        format.html { redirect_to @country_reference, notice: "Country reference was successfully created." }
        format.json { render :show, status: :created, location: @country_reference }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @country_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /country_references/1 or /country_references/1.json
  def update
    respond_to do |format|
      if @country_reference.update(country_reference_params)
        format.html { redirect_to @country_reference, notice: "Country reference was successfully updated." }
        format.json { render :show, status: :ok, location: @country_reference }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @country_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country_references/1 or /country_references/1.json
  def destroy
    @country_reference.destroy

    respond_to do |format|
      format.html { redirect_to country_references_path, status: :see_other, notice: "Country reference was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country_reference
      @country_reference = CountryReference.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_reference_params
      params.require(:country_reference).permit(:country_code, :country)
    end
end
