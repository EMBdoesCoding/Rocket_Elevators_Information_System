class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :contact_name
      t.string :company_name
      t.string :email
      t.string :phone
      t.string :project_name
      t.text :project_description
      t.string :department
      t.text :message
      t.blob :attached_file, limit: 10.megabyte
      t.string :contact_request_date

      t.timestamps
    end
  end
end
