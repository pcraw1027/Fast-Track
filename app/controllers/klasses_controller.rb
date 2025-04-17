class KlassesController < ApplicationController
  before_action :set_klass, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit create]

  # GET /klasses or /klasses.json
  def index
    @klasses = Klass.all
  end

  # GET /klasses/1 or /klasses/1.json
  def show
  end

  def by_family
    klasses = Klass.where(family_id: params[:family_id])
    render json: klasses.select(:id, :code, :title)
  end
  
  # GET /klasses/new
  def new
    @klass = Klass.new
  end

  # GET /klasses/1/edit
  def edit
  end

  # POST /klasses or /klasses.json
  def create
    @klass = Klass.new(klass_params)

    respond_to do |format|
      if @klass.save
        format.html { redirect_to @klass, notice: "Klass was successfully created." }
        format.json { render :show, status: :created, location: @klass }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @klass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /klasses/1 or /klasses/1.json
  def update
    respond_to do |format|
      if @klass.update(klass_params)
        format.html { redirect_to @klass, notice: "Klass was successfully updated." }
        format.json { render :show, status: :ok, location: @klass }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @klass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /klasses/1 or /klasses/1.json
  def destroy
    @klass.destroy

    respond_to do |format|
      format.html { redirect_to klasses_path, status: :see_other, notice: "Klass was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_klass
      @klass = Klass.find(params[:id])
    end

    def set_dropdowns
      @families = Family.all
      @product_category_sources = ProductCategorySource.all
    end

    # Only allow a list of trusted parameters through.
    def klass_params
      params.require(:klass).permit(:code, :title, :description, :family_id, :product_category_source_id)
    end
end
