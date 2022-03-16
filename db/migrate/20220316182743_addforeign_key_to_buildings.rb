class AddforeignKeyToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :buildings, :addresses
  end
end
