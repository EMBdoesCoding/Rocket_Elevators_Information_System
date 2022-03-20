class CreateFactQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_quotes do |t|
      t.string :quoteid
      t.datetime :creation
      t.string :company_name
      t.string :email
      t.string :nbelevator
    end
  end
end
