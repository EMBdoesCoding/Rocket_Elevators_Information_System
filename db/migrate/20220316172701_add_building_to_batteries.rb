class AddBuildingToBatteries < ActiveRecord::Migration[5.2]
  def change
    add_reference :batteries, :building
  end
end
