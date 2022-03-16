class RemoveEmployeeIdFromBattery < ActiveRecord::Migration[5.2]
  def change
    remove_column :batteries, :employee_id, :string
  end
end
