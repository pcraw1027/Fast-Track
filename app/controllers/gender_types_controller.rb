class GenderTypesController < ApplicationController
  before_action :set_gender_type, only: %i[ show edit update destroy ]

  # GET /gender_types or /gender_types.json
  def index
    @gender_types = GenderType.all
  end

  # GET /gender_types/1 or /gender_types/1.json
  def show
  end

  # GET /gender_types/new
  def new
    @gender_type = GenderType.new
  end

  # GET /gender_types/1/edit
  def edit
  end

  # POST /gender_types or /gender_types.json
  def create
    @gender_type = GenderType.new(gender_type_params)

    respond_to do |format|
      if @gender_type.save
        format.html { redirect_to @gender_type, notice: "Gender type was successfully created." }
        format.json { render :show, status: :created, location: @gender_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gender_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gender_types/1 or /gender_types/1.json
  def update
    respond_to do |format|
      if @gender_type.update(gender_type_params)
        format.html { redirect_to @gender_type, notice: "Gender type was successfully updated." }
        format.json { render :show, status: :ok, location: @gender_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gender_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gender_types/1 or /gender_types/1.json
  def destroy
    @gender_type.destroy

    respond_to do |format|
      format.html { redirect_to gender_types_path, status: :see_other, notice: "Gender type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gender_type
      @gender_type = GenderType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gender_type_params
      params.require(:gender_type).permit(:gender, :definition)
    end
end
