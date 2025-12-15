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

      def self.load_data(per_page:, page:, user_id:, list_type:)
          page     = page.to_i.positive? ? page.to_i : 1
          per_page = per_page.to_i.positive? ? per_page.to_i : 10
          offset   = (page - 1) * per_page

          base_query = where(user_id: user_id, list_type: list_type)

          total_count = base_query.count

          records = base_query
                    .order(default: :desc, updated_at: :desc)
                    .limit(per_page)
                    .offset(offset)

          PaginatedResult.new(records, per_page, page, total_count)
        end

    end
  end
end

