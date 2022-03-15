class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :customer_id
      t.string :building_address
      t.string :building_administrator_name
      t.string :building_administrator_email
      t.string :building_administrator_phone
      t.string :tech_contact_name
      t.string :tech_contact_email
      t.string :tech_contact_phone

      t.timestamps
    end
  end
end
