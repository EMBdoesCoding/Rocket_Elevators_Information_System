class RenameTypeToBuildingTypeInBatteries < ActiveRecord::Migration[5.2]
  def change
    rename_column :batteries, :type, :building_type
  end
end
