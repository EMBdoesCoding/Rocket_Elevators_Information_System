class RemoveBatteryIdFromColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :columns, :battery_id, :string
  end
end
