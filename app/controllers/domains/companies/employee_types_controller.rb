class Domains::Companies::EmployeeTypesController < ApplicationController
  before_action :set_employee_type, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update create destroy]

  # GET /employee_types or /employee_types.json
  def index
    @employee_types = Domains::Companies::EmployeeType.all
  end

  # GET /employee_types/1 or /employee_types/1.json
  def show
  end

  # GET /employee_types/new
  def new
    @employee_type = Domains::Companies::EmployeeType.new
  end

  # GET /employee_types/1/edit
  def edit
  end

  # POST /employee_types or /employee_types.json
  def create
    @employee_type = Domains::Companies::EmployeeType.new(employee_type_params)

    respond_to do |format|
      if @employee_type.save
        format.html { redirect_to @employee_type, notice: "Employee type was successfully created." }
        format.json { render :show, status: :created, location: @employee_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_types/1 or /employee_types/1.json
  def update
    respond_to do |format|
      if @employee_type.update(employee_type_params)
        format.html { redirect_to @employee_type, notice: "Employee type was successfully updated." }
        format.json { render :show, status: :ok, location: @employee_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_types/1 or /employee_types/1.json
  def destroy
    @employee_type.destroy

    respond_to do |format|
      format.html do
    redirect_to domains_companies_employee_types_path, status: :see_other, notice: "Employee type was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_type
      @employee_type = Domains::Companies::EmployeeType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_type_params
      params.require(:domains_companies_employee_type).permit(:employee, :definition)
    end
end
