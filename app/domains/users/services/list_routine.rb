module Domains
  module Users
    class ListRoutine
      DEFAULT_LIST_NAME = "Liked"

      def initialize(user_id:, list_id: nil)
        @user_id = user_id
        @list_id = list_id
      end

      def spawn_default
        Domains::Users::List.create(
          user_id: @user_id,
          name: DEFAULT_LIST_NAME,
          list_type: 0,
          default: true
        ) unless list_exist?(DEFAULT_LIST_NAME)
      end
      
      def make_default!
        raise ArgumentError, "Missing list_id or user_id" unless @list_id && @user_id
        Domains::Users::List.transaction do
          Domains::Users::List.where(user_id: @user_id).update_all(default: false)
          Domains::Users::List.where(id: @list_id, user_id: @user_id).update_all(default: true)
        end
      end

      def create_list(name:, list_type:, default: false, description: "")
        raise ArgumentError, "Missing ser_id" unless @user_id
        list = nil
        default = false if default.blank?          
        list_type = Domains::Users::List::LIST_TYPE_MAP.fetch(list_type, 0)
        Domains::Users::List.transaction do
          Domains::Users::List.where(user_id: @user_id).update_all(default: false) if default
          list = Domains::Users::List.create(user_id: @user_id, default: default, name: name,
          description: description)
        end
        list
      end

      def add_list_resource(barcode:, resource_type: nil, resource_id: nil)
        list_id = @list_id.presence || default_list_id
        attrs = {
          barcode: barcode,
          list_id: list_id
        }

        if resource_id.present?
          attrs.merge!(
            listable_id: resource_id,
            listable_type: resource_type
          )
          return if Domains::Features::Listable::ListResource.find_by(attrs)
        else
          return if Domains::Features::Listable::ListResource.find_by(attrs)
        end
        Domains::Features::Listable::ListResource.create(attrs)
      end

      def remove_list_resource(resource_id:)
        Domains::Features::Listable::ListResource.where(listable_id: resource_id,
          list_id: @list_id.presence || default_list_id).delete_all
      end


      def default_list_id
        Domains::Users::List
          .where(user_id: @user_id, default: true)
          .pick(:id) #looks up only the id column, ideal for performance critical usecase
      end

      
      def default_list
        Domains::Users::List.find_by(user_id: @user_id, default: true)
      end


      def self.resolve_resource(resource_id:, resource_type:, barcode:)
        Domains::Features::Listable::ListResource
          .where(barcode: barcode)
          .update_all(
            listable_id: resource_id,
            listable_type: resource_type
          )
      end

      def list_exist?(list_name)
        Domains::Users::List.exists?(user_id: @user_id, name: list_name)
      end

    end
  end
end
