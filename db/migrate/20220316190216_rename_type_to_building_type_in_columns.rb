class RenameTypeToBuildingTypeInColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :columns, :type, :building_type
  end
end
