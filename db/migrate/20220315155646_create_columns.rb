class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.string :battery_id
      t.string :type
      t.string :number_of_floors_served
      t.string :status
      t.text :information
      t.text :notes

      t.timestamps
    end
  end
end
