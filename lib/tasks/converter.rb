require 'pg'
require 'mysql2'
def move_quote
    Quote.all.each do |q|
    FactQuote.create!(
            {
                quoteid: q.id,
                creation: q.date_created,
                company_name: q.company_name,
                email: q.contact_email,
                nbelevator: q.elevator_amount
            }
        )
    end
end
move_quote()
puts "=== FactQuote imported ==="
def move_contacts
    Lead.all.each do |l|
    FactContact.create!(
        {
            contactid: l.id,
            creation_date: l.contact_request_date,
            company_name: l.company_name,
            email: l.email,
            project_name: l.project_name,
        }
    )
    end
end
move_contacts()
puts "=== FactContact imported ==="
def move_customers
    Customer.all.each do |c|
        elevator_number = 0
        c.buildings.all.each do |building|
            building.batteries.all.each do |battery|
                battery.columns.all.each do |column|
                    elevator_number += column.elevators.count
                end
            end
        end
        DimCustomer.create!(
            {
                creation_date: c.creation_date,
                company_name: c.company_name,
                main_contact_name: c.company_contact_name,
                main_contact_email: c.company_contact_email,
                num_of_elevators: elevator_number,
                customer_city: c.address.city
            }
        )
    end
end
move_customers()
puts "=== DimCustomer imported ==="
def move_elevators
    Elevator.all.each do |e|
        # binding.pry
        FactElevator.create!(
            {
                serial_num: e.serial_number,
                date_of_commision: e.commission_date,
                building_id: Battery.find(Column.find(e.column_id).battery_id).building_id,
                customer_id: Building.find(Battery.find(Column.find(e.column.id).battery_id).building_id).customer_id,
                building_city: Address.find(Building.find(Battery.find(Column.find(e.column.id).battery_id).building_id).address_id).city,
            }
        )
    end
end
move_elevators()
puts "=== FactElevator imported ==="