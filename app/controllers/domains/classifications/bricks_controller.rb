class Domains::Classifications::BricksController < ApplicationController
  before_action :set_brick, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit create]

  # GET /bricks or /bricks.json
  def index
    if params[:product_category_source_id]
      product_category_source_id = Domains::Classifications::ProductCategorySource
              .find_by(code: params[:product_category_source_id]).id 
      @bricks = Domains::Classifications::Brick.where(product_category_source_id: product_category_source_id)
                  .paginate(page: params[:page], per_page: 20).order(
                              created_at: :desc, id: :desc
                            )
    else 
      @bricks = Domains::Classifications::Brick.all.paginate(page: params[:page], per_page: 20)
                    .order(created_at: :desc, id: :desc)
    end
  end

  # GET /bricks/1 or /bricks/1.json
  def show
  end

  def by_klass
    bricks = Domains::Classifications::Brick.where(klass_id: params[:klass_id])
    render json: bricks.select(:id, :code, :title)
  end

  def by_title_search
      search_result = if params[:q].present?
              Domains::Classifications::Brick.where("title ILIKE ?", "%#{params[:q]}%")
            else
              Domains::Classifications::Brick.none
            end
      brick_h = search_result&.group_by(&:klass_id)
      klasses = Domains::Classifications::Klass.includes(family: [:segment]).where(id: search_result&.map(&:klass_id))
      result = []

      klasses.each do |klass|  
        brick_h[klass.id].each do |brick|   
          family = klass.family
          segment = family.segment
          result << {
            id: brick.id,
            code: brick.code,
            title: brick.title,
            klass: {id: klass.id, code: klass.code, title: klass.title },              
            family: {id: family.id, code: family.code, title: family.title},
            segment: {id: segment.id, code: segment.code, title: segment.title }
          }  
        end     
      end

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

    # Only allow a list of trusted parameters through.
    def brick_params
      params.require(:domains_classifications_brick).permit(:code, :title, :description, :klass_id, 
      :product_category_source_id)
    end
end
