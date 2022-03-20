class CreateDimCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
      t.datetime :creation_date
      t.string :company_name
      t.string :main_contact_name
      t.string :main_contact_email
      t.string :num_of_elevators
      t.string :customer_city
    end
  end
end
