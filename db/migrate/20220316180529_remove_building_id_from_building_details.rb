class RemoveBuildingIdFromBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :building_details, :building_id, :string
  end
end
