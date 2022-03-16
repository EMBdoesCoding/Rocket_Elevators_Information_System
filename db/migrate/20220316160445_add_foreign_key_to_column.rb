class AddForeignKeyToColumn < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :columns, :batteries
  end
end
