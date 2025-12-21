class RemoveUniqIndexOnList < ActiveRecord::Migration[6.1]
  def change
    remove_index :list_resources, name: "index_list_res_on_listable_and_list"
  end
end
