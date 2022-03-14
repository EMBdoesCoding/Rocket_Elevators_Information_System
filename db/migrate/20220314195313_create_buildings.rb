class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :customer_id
      t.string :address
      t.string :building_administrator_name
      t.string :building_administrator_email
      t.string :building_administrator_phone
      t.string :technical_contact_name
      t.string :technical_contact_email
      t.string :technical_contact_phone

      t.timestamps
    end
  end
end
