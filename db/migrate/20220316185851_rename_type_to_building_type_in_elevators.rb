class RenameTypeToBuildingTypeInElevators < ActiveRecord::Migration[5.2]
  def change
    rename_column :elevators, :type, :building_type
  end
end
