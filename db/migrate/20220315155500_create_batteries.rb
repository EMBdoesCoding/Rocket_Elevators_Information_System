class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.string :building_id
      t.string :type
      t.string :status
      t.string :employee_id
      t.string :commission_date
      t.string :last_inspection_date
      t.string :certificate_of_operations
      t.text :information
      t.text :notes

      t.timestamps
    end
  end
end
