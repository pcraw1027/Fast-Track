class CreateEmployeeTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_types do |t|
      t.string :employee
      t.string :definition

      t.timestamps
    end
  end
end
