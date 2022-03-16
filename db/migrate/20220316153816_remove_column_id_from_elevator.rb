class RemoveColumnIdFromElevator < ActiveRecord::Migration[5.2]
  def change
    remove_column :elevators, :column_id, :string
  end
end
