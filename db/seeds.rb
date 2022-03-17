# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Employee.delete_all
User.delete_all
AdminUser.delete_all
Lead.delete_all
Address.delete_all
Customer.delete_all
Building.delete_all
Elevator.delete_all
Column.delete_all
Battery.delete_all


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

address_text = File.read(Rails.root.join('lib', 'seeds', 'Address.json'))
address_parse = JSON.parse(address_text)
randomarray = Array.new(address_parse['address'].count) {|e| e += 1}
arandom = randomarray.shuffle

counter = 0
#Generate real addresses
28.times do
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
end
puts "Address table populated"

# generate random leads
706.times do 
    Lead.create!(
        contact_name:   Faker::Name.name,
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

# generate random users
57.times do   
    User.create!(
        email:  Faker::Internet.email,
        password: 'password',
                     
    )
end 

#generate random customers
37.times do 
    user = User.create!(
        email: Faker::Internet.email,
        password: 'password'
    )
    record = Address.first,
    Customer.create!(
        user_id: user,
        creation_date:  Faker::Date.between(from: 3.years.ago, to: Date.today),
        company_name:   Faker::Company.name,
        address_id: record,
        company_contact_name:   Faker::Name.name,
        company_contact_phone:  Faker::PhoneNumber.cell_phone,
        company_contact_email:  user.email,
        company_description:    Faker::Quote.yoda,
        technical_authority_name:   Faker::Name.name,
        technical_authority_phone:  Faker::PhoneNumber.cell_phone,
        teachnical_authority_email: Faker::Internet.email,
        )
end


#generate random buildings
28.times do 
    Building.create!(        
        # customer_id:,
        # address_id: ,
        building_administrator_name:    Faker::Name.name,
        building_administrator_email:   Faker::Internet.email,
        building_administrator_phone:   Faker::PhoneNumber.cell_phone,
        tech_contact_name:  Faker::Name.name,
        tech_contact_email: Faker::Internet.email,
        tech_contact_phone: Faker::PhoneNumber.cell_phone,        
        )
end

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

#Generate random batteries
15.times do 
    Battery.create!(        
        building_id:    Faker::Number.between(from: 1, to: 28),
        building_type:   ["Residential", "Commercial","Corporate", "Hybrid"].sample,
        status: ["Running", "Not Running"].sample,
        # employee_id: ,
        commission_date:    Faker::Date.between(from: 3.years.ago, to: Date.today),
        last_inspection_date:   Faker::Date.between(from: 3.years.ago, to: Date.today),
        certificate_of_operations:  Faker::Code.rut,
        information:    Faker::Lorem.sentence,
        notes:  Faker::Lorem.paragraph,
    )
end

# #generate random building details
# 28.times do 
#     Building_detail.create!(        
#         building_id:    Faker::Number.between(from: 1, to: 20),
#         info_key:   [Type, Construction Year, Number of Elevators Inside, Maximum Number of Occupants, Renovation Year],
#         value:  ["Residential", "Commercial","Corporate", "Hybrid".sample, Faker::Date.between(from: '1954-01-01', to: '2022-03-16'), Faker::Number.between(from: 1, to: 12), Faker::Number.between(from: 1, to: 300), Faker::Date.between(from: '1954-01-01', to: '2022-03-16') ]
#     )
# end







AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?