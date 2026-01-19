class Api::V1::Users::ListsController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_list, only: %i[ update destroy ]

  def show
    list = Domains::Users::List.find(params[:id])
    render json: list, status: :ok
  end
  
  def remove_list_resource
    Domains::Users::ListRoutine.new(
      user_id: current_user.id, list_id: params[:id]
      ).remove_list_resource(resource_id: params[:resource_id], resource_type: "Domains::Products::Product")
    render json: {message: "Resource removal processed successfully"}, status: :ok    
  end

  def my_lists
    page = params[:page] || 1
    per_page = params[:per_page] || 20
    per_page = 20 if per_page.to_i > 20
    list_type = Domains::Users::List::LIST_TYPE_MAP.fetch(params[:list_type], 0)

    resources = Domains::Users::List.load_data(
      per_page: per_page, page: page, user_id: current_user.id, list_type: list_type)
    
    render json: resources, status: :ok
  end

  def list_resources
    page = params[:page] || 1
    per_page = params[:per_page] || 20
    per_page = 20 if per_page.to_i > 20
    list_type = params[:list_type].blank? ? nil : Domains::Features::Listable::ListResource::LISTABLE_TYPE_MAP.fetch(
      params[:list_type])

    resources = Domains::Features::Listable::ListResource.load_data(
      per_page: per_page, page: page, list_id: params[:id], listable_type: list_type)
    
    render json: resources, status: :ok
  end

  def listed_products
    page = params[:page] || 1
    per_page = params[:per_page] || 20
    per_page = 20 if per_page.to_i > 20

    products = Domains::Features::Listable::ListResource.listed_products(
      user_id: current_user.id, page: page, per_page: per_page)
    render json: products, status: :ok
  end

  

  def resource_lists
    page = params[:page] || 1
    per_page = params[:per_page] || 20
    per_page = 20 if per_page.to_i > 20
    list_type = params[:list_type].blank? ? "Domains::Products::Product" : Domains::Features::Listable::ListResource::LISTABLE_TYPE_MAP[params[:list_type]]

    resources = Domains::Users::List.load_resource_lists(
      per_page: per_page, page: page,listable_id: params[:resource_id], 
      listable_type: list_type, user_id: current_user.id)
    
    render json: resources, status: :ok
  end

  def add_to_list
      Domains::Users::ListRoutine.new(user_id: current_user.id,
              list_id: params[:id]).add_list_resource(
                barcode: params[:barcode], 
                resource_type: "Domains::Products::Product", resource_id: params[:resource_id]
                )
      
    render json: {message: "Resource added to list successfully"}, status: :ok
  end

  def change_list
    Domains::Users::ListRoutine.new(
    user_id: current_user.id, list_id: params[:old_list_id]
    ).remove_list_resource(resource_id: params[:resource_id],
      resource_type: "Domains::Products::Product")
    Domains::Users::ListRoutine.new(user_id: current_user.id,
    list_id: params[:new_list_id]).add_list_resource(
      barcode: params[:barcode], 
      resource_type: "Domains::Products::Product", resource_id: params[:resource_id]
      )
    render json: {message: "List change processed successfully"}, status: :ok     
  end

  def remove_from_user_lists
    Domains::Users::ListRoutine.new(
    user_id: current_user.id
    ).remove_from_user_lists(resource_id: params[:resource_id], 
    resource_type: "Domains::Products::Product")
    render json: {message: "List change processed successfully"}, status: :ok     
  end

  def make_default
    begin
        Domains::Users::ListRoutine.new(user_id: current_user.id, list_id: params[:id]).make_default!
        render json: {message: "list is made default successfully"}, status: :ok    
    rescue => e
        render json: { error: e.message }, status: :bad_request 
    end
  end

  def create
    begin
      if Domains::Users::ListRoutine.new(user_id: current_user.id).list_exist?(list_params[:name])
          render json: {
          message: Domains::Users::List.name_inuse_err_msg(list_params[:name])
        }, status: :unprocessable_entity
      else
        list = Domains::Users::ListRoutine.new(
          user_id: current_user.id).create_list(name: list_params[:name], 
          list_type: list_params[:list_type], default: list_params[:default], 
          description: list_params[:description])
          render json: list, status: :created

      end
      
    rescue => e
        render json: {
          message: "List couldn't be created successsfully. #{e.message}"
        }, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params.except(:default, :snapshot_aggregate))
        render json: @list, status: :ok
    else
        render json: { error: @list.errors }, status: :unprocessable_entity 
    end
  end

  def destroy
    @list.destroy
    render json: {message: "list deleted successfully"}, status: :ok 
  end


  private


    def set_list
      @list = Domains::Users::List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :default, :list_type, :description, :snapshot_aggregate)
    end


end