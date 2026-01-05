module Domains
  module Users
    class List < ApplicationRecord
      self.table_name = "lists"
      belongs_to :user, class_name: "Domains::Users::User"
      has_many :list_resources, class_name: "Domains::Features::Listable::ListResource", dependent: :destroy
      
      LIST_TYPE_MAP = {
                        "products" => 0,
                        "companies" => 1,
                        "cntents" => 2,
                      }.freeze

      enum list_type: { products: 0, companies: 1, contents: 2 }

      def self.name_inuse_err_msg(name)
        "Already have an existing List named #{name}"
      end

      def self.load_resource_lists(per_page:, page:, listable_id:, listable_type:, user_id:)
          page     = page.to_i.positive? ? page.to_i : 1
          per_page = per_page.to_i.positive? ? per_page.to_i : 10
          offset   = (page - 1) * per_page

          base_query = where(user_id: user_id)
                .joins(:list_resources)
                .where(list_resources: { listable_type: listable_type, listable_id: listable_id })
                total_count = base_query.count

          records = select(:id, :name, :default, :list_type, :description, 
                  :snapshot_aggregate, :created_at, :updated_at)
                    .where(user_id: user_id)
                    .joins(:list_resources)
                    .where(list_resources: { listable_type: listable_type, 
                            listable_id: listable_id })
                    .order(updated_at: :desc)
                    .limit(per_page)
                    .offset(offset)

          PaginatedResult.new(records, per_page, page, total_count)
      end
      

      def self.load_data(per_page:, page:, user_id:, list_type:)
          page     = page.to_i.positive? ? page.to_i : 1
          per_page = per_page.to_i.positive? ? per_page.to_i : 10
          offset   = (page - 1) * per_page

          base_query =
            left_joins(:list_resources)
              .where(
                user_id: user_id,
                list_type: list_type,
                list_resources: { listable_type: "Domains::Products::Product" }
              )
              .group("lists.id")
              .select(
                "lists.*",
                "COUNT(list_resources.id) AS product_counts"
              )

          total_count = where(user_id: user_id, list_type: list_type).count

          records =
            base_query
              .order(default: :desc, updated_at: :desc)
              .limit(per_page)
              .offset(offset)
              .map do |list|
                res = list.as_json
                res[:product_counts] = list.product_counts.to_i
                res
              end

          PaginatedResult.new(records, per_page, page, total_count)
        end



    end
  end
end

