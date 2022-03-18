require 'pg'
require 'mysql2'
def move_quote
    Quote.all.each do |q|
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
def move_contacts
    User.all.each do |l|
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
def move_customers
    Customer.all.each do |c|
        elevator_number = 0
        customer_buildings.each do |building|
            batteries.each do |battery|
                columns.each do |column|
                    elevator_number += elevators.size
            end
        end
    end
        DimCustomer.create!(
            {
                created_at: c.created_at,
                company_contact_name: c.company_contact_name,
                company_contact_phone: c.company_contact_phone,
                company_contact_email: c.company_contact_email,
                elevator_number: elevator_number,
                customer_city: address.city
            }
        )
    end
end

def move_elevators
    Elevator.all.each do |e|
        FactElevator.create!(
            {
                serial_number: e.serial_number,
                commission_date: e.commission_date,
                building_id: building.id,
                customer_id: customer.id,
                elevator_number: elevator_number,
                building_city: address.city
            }
        )
    end
end
