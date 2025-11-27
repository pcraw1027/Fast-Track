class Domains::Classifications::BricksController < ApplicationController
  before_action :set_brick, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit create]
  before_action :authenticate_user!, only: %i[ new edit update create destroy]

  # GET /bricks or /bricks.json
  def index
    @product_category_sources =  Domains::Classifications::ProductCategorySource.all
    @brick = Domains::Classifications::Brick.new
    result = Domains::Classifications::Brick.index_data(params[:product_category_source_id],  
                                                params[:klass_id], params[:search_query], params[:page])
    @klass = result[0]
    @bricks = result[1]
  end

  # GET /bricks/1 or /bricks/1.json
  def show
  end

  def by_klass
    bricks = Domains::Classifications::Brick.where(klass_id: params[:klass_id])
    render json: bricks.select(:id, :code, :title)
  end

  def by_title_search
    result = Domains::Classifications::Brick.search_by_title(params[:q])
     render json: result
  end

  # GET /bricks/new
  def new
    @brick = Domains::Classifications::Brick.new
  end

  # GET /bricks/1/edit
  def edit
  end

  # POST /bricks or /bricks.json
  def create
    @brick = Domains::Classifications::Brick.new(brick_params)

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
      format.html { redirect_to domains_classifications_bricks_path, status: :see_other, notice: "Brick was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brick
      @brick = Domains::Classifications::Brick.find(params[:id])
    end

    def set_dropdowns
      @klasses = Domains::Classifications::Klass.all
      @product_category_sources = Domains::Classifications::ProductCategorySource.all
    end

    def convert_brick_params
    return if nested_brick_params[:domains_classifications_brick].blank?
      code = 01
      recent_klass_bricks = Domains::Classifications::Brick.where(
            klass_id: brick_params[:klass_id]).order(created_at: :desc).limit(1);
      if recent_klass_bricks.any?
        code = recent_klass_bricks[0].code + 1
      end

      nested_brick_params[:domains_classifications_brick].each_value do |brick_attributes|

          Domains::Classifications::Brick.create!(
            klass_id: brick_params[:klass_id],
            code: code,
            title: brick_attributes[:title],
            product_category_source_id: brick_params[:product_category_source_id]
          )
          code += 1
      end
    
  end
  
  def nested_brick_params
        params.require(:domains_classifications_brick).permit(
          bricks_attributes: [:title]
        )
  end

    # Only allow a list of trusted parameters through.
    def brick_params
      params.require(:domains_classifications_brick).permit(:code, :title, :description, :klass_id, 
      :product_category_source_id)
    end
end
