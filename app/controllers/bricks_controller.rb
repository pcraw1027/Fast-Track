class BricksController < ApplicationController
  before_action :set_brick, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit create]

  # GET /bricks or /bricks.json
  def index
    if params[:product_category_source_id]
      product_category_source_id = ProductCategorySource.find_by(code: params[:product_category_source_id]).id 
      @bricks = Brick.where(product_category_source_id: product_category_source_id).paginate(page: params[:page], per_page: 12).order(created_at: :desc, id: :desc)
    else 
      @bricks = Brick.all.paginate(page: params[:page], per_page: 12).order(created_at: :desc, id: :desc)
    end
  end

  # GET /bricks/1 or /bricks/1.json
  def show
  end

  def by_klass
    bricks = Brick.where(klass_id: params[:klass_id])
    render json: bricks.select(:id, :code, :title)
  end

  # GET /bricks/new
  def new
    @brick = Brick.new
  end

  # GET /bricks/1/edit
  def edit
  end

  # POST /bricks or /bricks.json
  def create
    @brick = Brick.new(brick_params)

    respond_to do |format|
      if @brick.save
        format.html { redirect_to @brick, notice: "Brick was successfully created." }
        format.json { render :show, status: :created, location: @brick }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @brick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bricks/1 or /bricks/1.json
  def update
    respond_to do |format|
      if @brick.update(brick_params)
        format.html { redirect_to @brick, notice: "Brick was successfully updated." }
        format.json { render :show, status: :ok, location: @brick }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @brick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bricks/1 or /bricks/1.json
  def destroy
    @brick.destroy

    respond_to do |format|
      format.html { redirect_to bricks_path, status: :see_other, notice: "Brick was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brick
      @brick = Brick.find(params[:id])
    end

    def set_dropdowns
      @klasses = Klass.all
      @product_category_sources = ProductCategorySource.all
    end

    # Only allow a list of trusted parameters through.
    def brick_params
      params.require(:brick).permit(:code, :title, :description, :klass_id, :product_category_source_id)
    end
end
