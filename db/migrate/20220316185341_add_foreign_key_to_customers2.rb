class AddForeignKeyToCustomers2 < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :customers, :users
  end
end
