class RemoveBuildingIdFromBattery < ActiveRecord::Migration[5.2]
  def change
    remove_column :batteries, :building_id, :string
  end
end
