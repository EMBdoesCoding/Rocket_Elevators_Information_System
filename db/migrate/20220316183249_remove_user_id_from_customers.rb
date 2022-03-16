class RemoveUserIdFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :user_id, :string
  end
end
