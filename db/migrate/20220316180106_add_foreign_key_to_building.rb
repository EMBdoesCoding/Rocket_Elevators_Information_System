class AddForeignKeyToBuilding < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :buildings, :customers
  end
end
