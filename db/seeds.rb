# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Employee.delete_all
Customer.delete_all
User.delete_all
AdminUser.delete_all
Lead.delete_all
Address.delete_all
Building.delete_all
Elevator.delete_all
Column.delete_all
Battery.delete_all
BuildingDetail.delete_all


require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'Employee_List.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    user = User.create!(
        email: row['email'],
        password: 'password'
    )

    AdminUser.create!(
        email: row['email'],
        password: 'password'
    )

    Employee.create!(
        first_name: row['first_name'],
        last_name: row['last_name'],
        title: row['title'],
        email: row['email'],
        user: user
    )
end

puts "There are now #{Employee.count} rows in the transactions table."










# Fake data seeding to be entered into database
require 'faker'
require 'json'

address_text = File.read(Rails.root.join('lib', 'seeds', 'Address.json'))
address_parse = JSON.parse(address_text)
randomarray = Array.new(address_parse['address'].count) {|e| e += 1}
arandom = randomarray.shuffle

counter = 0
#Generate real addresses
65.times do
    # csv.each do |row|
    Address.create!(

    type_of_address: ["Home","Buisness", "Shipping", "Billing", ].sample,
    status: ["Verified", "Unverified"].sample,
    entity: ["Customer", "Buisness"].sample,
    number_street: address_parse['address'][arandom[counter]]['address1'],
    suite_apartment: address_parse['address'][arandom[counter]]['address2'],
    city:address_parse['address'][arandom[counter]]['city'],
    postal_code:address_parse['address'][arandom[counter]]['postalCode'],
    country: "USA",
    notes:  Faker::Lorem.paragraph,
    )
    counter += 1
end
puts "-- ___-- Real Address Table Populated -- ___--"

# generate random leads
706.times do 
    Lead.create!(
        contact_name:   Faker::FunnyName.two_word_name,
        company_name:   Faker::Company.name,
        email:  Faker::Internet.email,
        phone:  Faker::PhoneNumber.cell_phone,
        project_name:   Faker::FunnyName.two_word_name,
        project_description:    Faker::Quote.yoda,
        department: ["Sales","Support","Administration"].sample,
        message:    Faker::Lorem.paragraph,
        attached_file: "File goes in here",
        contact_request_date:   Faker::Date.between(from: 3.years.ago, to: Date.today)
    )
end
puts "-- ___-- Lead Table Populated -- ___--"

# generate random users
# 57.times do   
#     User.create!(
#         email:  Faker::Internet.email,
#         password: 'password',
                     
#     )
# end 

#generate random customers
counter = 0
record = Address.first.id
37.times do 
    user = User.create!(
        email: Faker::Internet.email,
        password: 'password'
    )

    Customer.create!(
        user: user,
        creation_date:  Faker::Date.between(from: 3.years.ago, to: Date.today),
        company_name:   Faker::Company.name,
        address_id: record + counter,
        company_contact_name:   Faker::FunnyName.two_word_name,
        company_contact_phone:  Faker::PhoneNumber.cell_phone,
        company_contact_email:  user.email,
        company_description:    Faker::Movie.quote,
        technical_authority_name:   Faker::FunnyName.two_word_name,
        technical_authority_phone:  Faker::PhoneNumber.cell_phone,
        teachnical_authority_email: Faker::Internet.email,
    )
    counter += 1
end
puts "-- ___-- Customer Table Populated -- ___--"

#generate random buildings
cust = Customer.first.id
28.times do |e|
    Building.create!(        
        customer_id: cust + e,
        address_id: record + counter,
        building_administrator_name:    Faker::FunnyName.two_word_name,
        building_administrator_email:   Faker::Internet.email,
        building_administrator_phone:   Faker::PhoneNumber.cell_phone,
        tech_contact_name:  Faker::FunnyName.two_word_name,
        tech_contact_email: Faker::Internet.email,
        tech_contact_phone: Faker::PhoneNumber.cell_phone,        
    )
    counter += 1
end
puts "-- ___-- Bulding Table Populated -- ___--"


#Generate random batteries
15.times do 
    Battery.create!(        
        building_id:    Faker::Number.between(from: 1, to: 28),
        building_type:   ["Residential", "Commercial","Corporate", "Hybrid"].sample,
        status: ["Running", "Not Running"].sample,
        employee_id: Faker::Number.between(from: 1, to: Employee.count),
        commission_date:    Faker::Date.between(from: 3.years.ago, to: Date.today),
        last_inspection_date:   Faker::Date.between(from: 3.years.ago, to: Date.today),
        certificate_of_operations:  Faker::Code.rut,
        information:    Faker::Lorem.sentence,
        notes:  Faker::Lorem.paragraph,
    )
end
puts "-- ___-- Battery Table Populated -- ___--"

#generate random columns
35.times do 
    Column.create!(        
        battery_id: Faker::Number.between(from: 1, to: 15),
        building_type:   ["Residential", "Commercial","Corporate", "Hybrid"].sample,
        number_of_floors_served:    Faker::Number.between(from: 1, to: 70),
        status: ["Running", "Not Running"].sample,
        information:    Faker::Lorem.sentence,
        notes:  Faker::Lorem.paragraph,
    )
end
puts "-- ___-- Column Table Populated -- ___--"

#generate random elevators
202.times do 
    Elevator.create!(        
        column_id:  Faker::Number.between(from: 1, to: 35),
        serial_number:  Faker::Number.decimal_part(digits: 7),
        model: ["Standard", "Premium", "Excelium"].sample,
        building_type: ["Residential", "Commercial","Corporate", "Hybrid"].sample,
        status:["Running", "Not Running"].sample,
        commission_date:    Faker::Date.between(from: 3.years.ago, to: Date.today),
        last_inspection_date:   Faker::Date.between(from: 3.years.ago, to: Date.today),
        certificate_of_inspection:  Faker::Code.rut,
        information:    Faker::Lorem.paragraph,
        notes:  Faker::Quote.yoda,    
        ) 
end
puts "-- ___-- Elevator Table Populated"

info_key_array = ["Type", "Construction Year", "Number of Elevators Inside", "Maximum Number of Occupants", "Renovation Year"]
info_value_array = [["Residential", "Commercial","Corporate", "Hybrid"].sample, Faker::Date.between(from: '1954-01-01', to: '2022-03-16'), Faker::Number.between(from: 1, to: 12), Faker::Number.between(from: 1, to: 300), Faker::Date.between(from: '1954-01-01', to: '2022-03-16') ]


#generate random building details
28.times do  
    x = rand(5)
    BuildingDetail.create!(        
        building_id:    Faker::Number.between(from: 1, to: 28),
        info_key:   info_key_array[x],
        value:  [["Residential", "Commercial","Corporate", "Hybrid"].sample, Faker::Date.between(from: '1954-01-01', to: '2022-03-16'), Faker::Number.between(from: 1, to: 12), Faker::Number.between(from: 1, to: 300), Faker::Date.between(from: '1954-01-01', to: '2022-03-16') ][x],
    )
end
puts "-- ___-- Building Details Table Populated -- ___--"








AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?