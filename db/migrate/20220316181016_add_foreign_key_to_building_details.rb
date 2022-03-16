class AddForeignKeyToBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :building_details, :buildings
  end
end
