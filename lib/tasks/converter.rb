require 'pg'
require 'mysql2'

def self.move_quote
    Quote.all.each do |q|
    user = User.find(q.user_id)
    customer = Customer.find(user.id)

    FactQuote.create!(
            {
                quote_id: q.id,
                quote_created_at: q.created_at,
                company_name: q.company_name,
                email: q.email,
                number_of_elevators: q.number_of_elevators
            }
        )
    end
end

def self.move_contacts
    User.all.each do |l|
    customer = Customer.find(l.id)
    lead = Lead.find(l.id)

    FactContact.create!(
        {
            contact_id: l.id,
            created_at: l.created_at,
            company_name: customer.company_name,
            email: l.email,
            project_name: lead.project_name
        }
    )
    end
end

def self.move_customers
    Customer.all.each do |c|
        elevator_number = 0
        customer_buildings = Building.where(customer_id: c.id).to_a
        customer_buildings.each do |building|
            batteries = Battery.where(building_id: building.id).to_a
            batteries.each do |battery|
                columns = Column.where(battery_id: battery.id).to_a
                columns.each do |column|
                    elevators = Elevator.where(column_id: column.id).to_a
                    elevator_number += elevators.size
            end
        end
    end
        city = Address.find(c.address_id).city

        DimCustomer.create!(
            {
                created_at: c.created_at,
                company_contact_name: c.company_contact_name,
                company_contact_phone: c.company_contact_phone,
                company_contact_email: c.company_contact_email,
                elevator_number: elevator_number,
                customer_city: city
            }
        )
    end
end

def self.move_elevators
    Elevator.all.each do |e|
        column = Column.find(e.column_id)
        battery = Battery.find(column.battery_id)
        building = Building.find(battery.building_id)
        address = Address.find(building.address_id)
        customer = Customer.find(building.customer_id)

        FactElevator.create!(
            {
                serial_number: e.serial_number,
                commission_date: e.commission_date,
                building_id: building.id,
                customer_id: customer.id,
                building_city: address.city
            }
        )
    end
end
# wowo