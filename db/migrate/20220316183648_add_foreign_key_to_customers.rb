class AddForeignKeyToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :customers, :addresses
  end
end
