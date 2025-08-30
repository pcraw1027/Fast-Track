class EthnicityTypesController < ApplicationController
  before_action :set_ethnicity_type, only: %i[ show edit update destroy ]

  # GET /ethnicity_types or /ethnicity_types.json
  def index
    @ethnicity_types = EthnicityType.all
  end

  # GET /ethnicity_types/1 or /ethnicity_types/1.json
  def show
  end

  # GET /ethnicity_types/new
  def new
    @ethnicity_type = EthnicityType.new
  end

  # GET /ethnicity_types/1/edit
  def edit
  end

  # POST /ethnicity_types or /ethnicity_types.json
  def create
    @ethnicity_type = EthnicityType.new(ethnicity_type_params)

    respond_to do |format|
      if @ethnicity_type.save
        format.html { redirect_to @ethnicity_type, notice: "Ethnicity type was successfully created." }
        format.json { render :show, status: :created, location: @ethnicity_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ethnicity_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ethnicity_types/1 or /ethnicity_types/1.json
  def update
    respond_to do |format|
      if @ethnicity_type.update(ethnicity_type_params)
        format.html { redirect_to @ethnicity_type, notice: "Ethnicity type was successfully updated." }
        format.json { render :show, status: :ok, location: @ethnicity_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ethnicity_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ethnicity_types/1 or /ethnicity_types/1.json
  def destroy
    @ethnicity_type.destroy

    respond_to do |format|
      format.html do
 redirect_to ethnicity_types_path, status: :see_other, notice: "Ethnicity type was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ethnicity_type
      @ethnicity_type = EthnicityType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ethnicity_type_params
      params.require(:ethnicity_type).permit(:ethnicity, :definition, :source)
    end
end
