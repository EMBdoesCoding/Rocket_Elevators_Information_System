class CreateFactContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_contacts do |t|
      t.string :contactid
      t.datetime :creation_date
      t.string :company_name
      t.string :email
      t.string :project_name
    end
  end
end
