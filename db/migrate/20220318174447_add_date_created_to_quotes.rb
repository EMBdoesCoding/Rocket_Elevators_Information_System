class AddDateCreatedToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :date_created, :string
  end
end
