class AddEmployeeToBatteries < ActiveRecord::Migration[5.2]
  def change
    add_reference :batteries, :employee
  end
end
