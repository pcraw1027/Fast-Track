class Domains::Classifications::BricksController < ApplicationController
  before_action :set_brick, only: %i[ show edit update destroy ]
  before_action :set_dropdowns, only: %i[ new edit create]
  before_action :authenticate_user!, only: %i[ new edit update create destroy brick_capture create_bulk]

  # GET /bricks or /bricks.json
  def index
    @product_category_sources = Domains::Classifications::ProductCategorySource.all
    @brick = Domains::Classifications::Brick.new
    page = params[:page].blank? ? 1 : params[:page]
    result = Domains::Classifications::Brick.index_data(params[:p_cat_id],  
                                                params[:klass_id], params[:search_query], page)
    @klass = result[0]
    @bricks = result[1]
    @search_query = params[:search_query]
    @product_category_source = @product_category_sources.select { |pc| pc.id == params[:p_cat_id] }
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
        format.html { redirect_to domains_classifications_brick_path(id: @brick.id,
                                        klass_id: params[:domains_classifications_brick][:k_id],
                                      page: params[:domains_classifications_brick][:page], 
                                      search_query: params[:domains_classifications_brick][:search_query],
                                      p_cat_id: params[:domains_classifications_brick][:p_cat_id] ), notice: "Brick was successfully created." }
        format.json { render :show, status: :created, location: @brick }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @brick.errors, status: :unprocessable_entity }
      end
    end
  end

  def brick_capture
    @brick = Domains::Classifications::Brick.new
    @klass = Domains::Classifications::Klass.find(params[:klass_id])
    @product_category_source = Domains::Classifications::ProductCategorySource.find(params[:p_cat_id])
  end

  def create_bulk
    error_message = nil
    begin
      convert_brick_params
    rescue => e
      error_message = e.message
    ensure
      respond_to do |format|
        if error_message
          format.html do 
            redirect_to brick_capture_path(klass_id: brick_params[:klass_id], 
                                      page: params[:domains_classifications_brick][:page], 
                                      search_query: params[:domains_classifications_brick][:search_query],
                                      p_cat_id: brick_params[:product_category_source_id]), 
                                      status: :unprocessable_entity, alert: error_message 
          end
        else
          format.html do 
            redirect_to domains_classifications_bricks_path(
              klass_id: brick_params[:klass_id],
              page: params[:domains_classifications_brick][:page], 
              search_query: params[:domains_classifications_brick][:search_query],
              p_cat_id: brick_params[:product_category_source_id]
            ), notice: "Submitted titles created."
          end
        end
      end
    end 
  end



  # PATCH/PUT /bricks/1 or /bricks/1.json
  def update
    respond_to do |format|
      if @brick.update(brick_params)
        format.html { redirect_to domains_classifications_brick_path(id: @brick.id,
                                        klass_id: params[:domains_classifications_brick][:k_id],
                                      page: params[:domains_classifications_brick][:page], 
                                      search_query: params[:domains_classifications_brick][:search_query],
                                      p_cat_id: params[:domains_classifications_brick][:p_cat_id] ), notice: "Brick was successfully updated." }
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
      format.html { redirect_to domains_classifications_bricks_path(
                                      klass_id: params[:klass_id],
                                      page: params[:page], 
                                      search_query: params[:search_query],
                                      p_cat_id: params[:p_cat_id]

          ), status: :see_other, notice: "Brick was successfully deleted." }
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
    return if nested_brick_params[:attribute_titles_attributes].blank?

      code = 0o1
      recent_klass_bricks = Domains::Classifications::Brick.where(
        klass_id: brick_params[:klass_id]
      ).order(created_at: :desc).limit(1)
      code = recent_klass_bricks[0].code + 1 if recent_klass_bricks.any?

      nested_brick_params[:attribute_titles_attributes].each_value do |brick_attributes|
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
          attribute_titles_attributes: [:title]
        )
  end

    # Only allow a list of trusted parameters through.
    def brick_params
      params.require(:domains_classifications_brick).permit(:code, :title, :description, :klass_id, 
      :product_category_source_id)
    end
end
