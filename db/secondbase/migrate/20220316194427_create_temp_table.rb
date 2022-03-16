class CreateTempTable < ActiveRecord::Migration[5.2]
  def change
    create_table :temp_tables do |t|
      t.string :name
    end
  end
end
