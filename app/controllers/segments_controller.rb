class SegmentsController < ApplicationController
  before_action :set_segment, only: %i[ show edit update destroy ]

  # GET /segments or /segments.json
  def index
    if params[:product_category_source_id]
      product_category_source_id = ProductCategorySource.find_by(code: params[:product_category_source_id]).id 
      @segments = Segment.where(product_category_source_id: product_category_source_id).paginate(page: params[:page], per_page: 12).order(created_at: :desc, id: :desc)
    else 
      @segments = Segment.all.paginate(page: params[:page], per_page: 12).order(created_at: :desc, id: :desc)
    end
  end

  # GET /segments/1 or /segments/1.json
  def show
  end

  # GET /segments/new
  def new
    @segment = Segment.new
    @product_category_sources = ProductCategorySource.all
  end

  # GET /segments/1/edit
  def edit
    @product_category_sources = ProductCategorySource.all
  end

  # POST /segments or /segments.json
  def create
    @segment = Segment.new(segment_params)

    respond_to do |format|
      if @segment.save
        format.html { redirect_to @segment, notice: "Segment was successfully created." }
        format.json { render :show, status: :created, location: @segment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /segments/1 or /segments/1.json
  def update
    respond_to do |format|
      if @segment.update(segment_params)
        format.html { redirect_to @segment, notice: "Segment was successfully updated." }
        format.json { render :show, status: :ok, location: @segment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /segments/1 or /segments/1.json
  def destroy
    @segment.destroy

    respond_to do |format|
      format.html { redirect_to segments_path, status: :see_other, notice: "Segment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_segment
      @segment = Segment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def segment_params
      params.require(:segment).permit(:code, :title, :description, :product_category_source_id)
    end
end
