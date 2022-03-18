class RenameTypeToTypeOfAddressInAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :type, :type_of_address
  end
end
