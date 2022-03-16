class AddforeignKeyToBattery < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :batteries, :buildings
  end
end
