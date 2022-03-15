class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.string :column_id
      t.string :serial_number
      t.string :model
      t.string :type
      t.string :status
      t.string :commission_date
      t.string :last_inspection_date
      t.string :certificate_of_inspection
      t.text :information
      t.text :notes

      t.timestamps
    end
  end
end
