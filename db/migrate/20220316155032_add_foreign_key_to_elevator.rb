class AddForeignKeyToElevator < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :elevators, :columns
  end
end
