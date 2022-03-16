class AddColumnToElevators < ActiveRecord::Migration[5.2]
  def change
    add_reference :elevators, :column
  end
end
