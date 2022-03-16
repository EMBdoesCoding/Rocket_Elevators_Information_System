class RemoveHqAddressFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :hq_address, :string
  end
end
