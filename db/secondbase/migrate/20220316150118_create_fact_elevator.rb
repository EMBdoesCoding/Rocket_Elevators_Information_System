class CreateFactElevator < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|
      t.string :serial_num
      t.string :date_of_commision
      t.string :building_id
      t.string :customer_id
      t.string :building_city
    end
  end
end
