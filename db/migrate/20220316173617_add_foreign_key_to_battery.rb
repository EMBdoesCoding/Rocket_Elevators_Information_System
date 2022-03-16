class AddForeignKeyToBattery < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :batteries, :employees 
  end
end
