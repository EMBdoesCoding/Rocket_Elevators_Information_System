class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :user_id
      t.string :creation_date
      t.string :company_name
      t.string :hq_address
      t.string :company_contact_name
      t.string :company_contact_phone
      t.string :company_contact_email
      t.text :company_description
      t.string :technical_authority_name
      t.string :technical_authority_phone
      t.string :teachnical_authority_email

      t.timestamps
    end
  end
end
