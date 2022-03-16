class RemoveCustomerIdFromBuilding < ActiveRecord::Migration[5.2]
  def change
    remove_column :buildings, :customer_id, :string
  end
end
