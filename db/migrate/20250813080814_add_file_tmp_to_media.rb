class AddFileTmpToMedia < ActiveRecord::Migration[6.1]
  def change
    add_column :media, :file_tmp, :string
  end
end
