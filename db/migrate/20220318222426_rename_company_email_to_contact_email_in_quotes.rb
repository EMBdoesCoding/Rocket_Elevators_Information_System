class RenameCompanyEmailToContactEmailInQuotes < ActiveRecord::Migration[5.2]
  def change
    rename_column :quotes, :company_email, :contact_email
  end
end
