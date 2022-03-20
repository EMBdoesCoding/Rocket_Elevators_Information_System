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

# Seeding with required employee csv file
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

puts "-- ___-- Employee Table Populated with #{Employee.count} records -- ___--"

# Fake data seeding to be entered into database
require 'faker'

#load and parse json file
address_text = File.read(Rails.root.join('lib', 'seeds', 'Address.json'));
address_parse = JSON.parse(address_text);

#create random array 
randomarray = Array.new(address_parse['address'].count-1) {|e| e += 1};
arandom = randomarray.shuffle;
counter = 0;

#-------Generate real addresses---------
(address_parse['address'].count-1).times do
    thisaddress = address_parse['address'][arandom[counter]]
    Address.create!(
        type_of_address: ["Home","Business", "Shipping", "Billing"].sample,
        status: ["Verified", "Unverified"].sample,
        entity: ["Customer", "Business"].sample,
        number_street: thisaddress['address1'],
        suite_apartment: thisaddress['address2'],
        city: thisaddress['city'],
        postal_code: thisaddress['postalCode'],
        country: "USA",
        notes:  Faker::Lorem.paragraph,
    )
    counter += 1
end
puts "-- ___-- Real Address Table Populated with #{Address.count} records -- ___--"

# ----------generate random leads---------
200.times do 
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
        contact_request_date:   Faker::Time.between(from: 3.years.ago, to: Date.today)
    )
end
puts "-- ___-- Lead Table Populated with #{Lead.count} records -- ___--"

#----------generate random customers--------
counter = 0
record = Address.first.id
15.times do 
    user = User.create!(
        email: Faker::Internet.email,
        password: 'password'
    )

    Customer.create!(
        user: user,
        creation_date:  Faker::Time.between(from: 3.years.ago, to: Date.today),
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
puts "-- ___-- Customer Table Populated with #{Customer.count} records -- ___--"

#-------generate random buildings--------
Customer.all.each do |customerloop|
    rand(1..4).times do
        Building.create!(        
            customer: customerloop,
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
end
puts "-- ___-- Building Table Populated with #{Building.count} records -- ___--"

#-------Generate random batteries-------
Building.all.each do |buildingloop|
    rand(1..3).times do
        case rand(1..10)
        when 1..9 then status = "Running"
        when 10 then status = "Not Running"
        end
        Battery.create!(        
            building: buildingloop,
            building_type: ["Residential", "Commercial","Corporate", "Hybrid"].sample,
            status: ["Running", "Running", "Running", "Running", "Not Running"].sample,
            employee_id: Faker::Number.between(from: Employee.first.id, to: (Employee.first.id+Employee.count-1)),
            commission_date:    Faker::Date.between(from: 3.years.ago, to: Date.today),
            last_inspection_date:   Faker::Date.between(from: 3.years.ago, to: Date.today),
            certificate_of_operations:  Faker::Code.rut,
            information:    Faker::Lorem.sentence,
            notes:  Faker::Lorem.paragraph,
        )
    end
end
puts "-- ___-- Battery Table Populated with #{Battery.count} records -- ___--"

#---------generate random columns---------
Battery.all.each do |batteryloop|
    if batteryloop.status == "Not Running"
        status = batteryloop.status
    else
        case rand(1..10)
        when 1..9 then status = "Running"
        when 10 then status = "Not Running"
        end
    end
    rand(1..4).times do 
        Column.create!(        
            battery: batteryloop,
            building_type: batteryloop.building_type,
            number_of_floors_served: Faker::Number.between(from: 1, to: 70),
            status: status,
            information: Faker::Lorem.sentence,
            notes: Faker::Lorem.paragraph,
        )
    end
end
puts "-- ___-- Column Table Populated with #{Column.count} records -- ___--"

#--------generate random elevators---------
Column.all.each do |columnloop|
    model = ["Standard", "Premium", "Excelium"].sample
    if columnloop.status == "Not Running"
        status = columnloop.status
    else
        case rand(1..10)
        when 1..9 then status = "Running"
        when 10 then status = "Not Running"
        end
    end
    rand(1..6).times do
        Elevator.create!(        
            column: columnloop,
            serial_number: Faker::Number.decimal_part(digits: 7),
            model: model,
            building_type: columnloop.building_type,
            status:status,
            commission_date:    Faker::Date.between(from: 3.years.ago, to: Date.today),
            last_inspection_date:   Faker::Date.between(from: 3.years.ago, to: Date.today),
            certificate_of_inspection:  Faker::Code.rut,
            information:    Faker::Lorem.paragraph,
            notes:  Faker::Quote.yoda,    
        )
    end
end
puts "-- ___-- Elevator Table Populated with #{Elevator.count} records -- ___--"

    
    
info_key_array = ["Type", "Construction Year", "Number of Elevators Inside", "Maximum Number of Occupants", "Renovation Year"]
# info_value_array = [["Residential", "Commercial","Corporate", "Hybrid"].sample, Faker::Date.between(from: '1954-01-01', to: '2022-03-16'), Faker::Number.between(from: 1, to: 12), Faker::Number.between(from: 1, to: 300), Faker::Date.between(from: '1954-01-01', to: '2022-03-16') ]

#--------generate random building details
(Building.count * 3).times do  
    x = rand(5)
    BuildingDetail.create!(        
        building_id:    Faker::Number.between(from: Building.first.id, to: (Building.first.id+Building.count - 1)),
        info_key:   info_key_array[x],
        value:  [["Residential", "Commercial","Corporate", "Hybrid"].sample, Faker::Date.between(from: '1954-01-01', to: '2022-03-16'), Faker::Number.between(from: 1, to: 12), Faker::Number.between(from: 1, to: 300), Faker::Date.between(from: '1954-01-01', to: '2022-03-16') ][x],
    )
end

puts "-- ___-- Building Details Table Populated with #{BuildingDetail.count} records -- ___--"


#-------generate random submitted quotes
def ResiCalc
    numberfloors = Faker::Number.between(from: 2, to: 60);
    numberapt = Faker::Number.between(from: numberfloors, to: numberfloors*50);
    numberbase = Faker::Number.between(from: 0, to: 10);
    totalelev = ((numberapt/numberfloors)/6.to_f).ceil * (numberfloors/20.to_f).ceil;
    return {buildingtype: "Residential", numberfloors: numberfloors, numberapt: numberapt, numberbase: numberbase, totalelev: totalelev};
end

def CommCalc
    numberfloors = Faker::Number.between(from: 2, to: 90);
    numbercomp = Faker::Number.between(from: 1, to: 100);
    numberbase = Faker::Number.between(from: 0, to: 10);
    numberpark = Faker::Number.between(from: 10, to: 300);
    numberelev = Faker::Number.between(from: 5, to: 30);
    return {buildingtype: "Commercial", numberfloors: numberfloors, numbercomp: numbercomp, numberbase: numberbase, numberpark: numberpark, numberelev: numberelev, totalelev: numberelev};
end

def CorpCalc
    numberfloors = Faker::Number.between(from: 2, to: 90);
    numberbase = Faker::Number.between(from: 0, to: 10);
    numberpark = Faker::Number.between(from: 10, to: 300);
    numbercorp = Faker::Number.between(from: 1, to: 100);
    maxocc = Faker::Number.between(from: 25, to: 1000);
    columnsreq = ((numberfloors + numberbase)/20.to_f).ceil;
    elevreq = ((maxocc*(numberfloors + numberbase))/1000.to_f).ceil;
    totalelev = (elevreq/columnsreq.to_f).ceil * columnsreq;
    hash = {buildingtype: "Corporate", numberfloors: numberfloors, numberbase: numberbase, numberpark: numberpark, numbercorp: numbercorp, maxocc: maxocc, totalelev: totalelev};
    return hash
end

def HybrCalc
    numberfloors = Faker::Number.between(from: 2, to: 80);
    numbercomp = Faker::Number.between(from: 1, to: 100);
    numberbase = Faker::Number.between(from: 0, to: 10);
    numberpark = Faker::Number.between(from: 10, to: 300);
    maxocc = Faker::Number.between(from: 25, to: 500);
    businesshours = Faker::Number.between(from: 10, to: 24);
    columnsreq = ((numberfloors + numberbase)/20.to_f).ceil;
    elevreq = ((maxocc*(numberfloors + numberbase))/1000.to_f).ceil;
    totalelev = (elevreq/columnsreq.to_f).ceil * columnsreq;
    hash = {buildingtype: "Hybrid", numberfloors: numberfloors, numberbase: numberbase, numberpark: numberpark, numbercomp: numbercomp, maxocc: maxocc, businesshours: businesshours, totalelev: totalelev};
    return hash
end

def GradeMult grade
    case grade
    when "Standard"
        return 0.1, 7500
    when "Premium"
        return 0.13, 12345
    when "Excelium"
        return 0.16, 15400
    else
        return nil
    end
end

def GetTypeHash buildingtype
    case buildingtype
    when "Residential"
        hash = ResiCalc()
    when "Commercial"
        hash = CommCalc()
    when "Corporate"
        hash = CorpCalc()
    when "Hybrid"
        hash = HybrCalc()
    else
        hash = nil
    end
    
    return hash
end


200.times do
    infohash = GetTypeHash(["Residential","Commercial","Corporate","Hybrid"].sample);
    servicegrade = ["Standard", "Premium", "Excelium"].sample;
    gradearr = GradeMult(servicegrade);
    totalunitprice = gradearr[1];
    totalelevprice = infohash[:totalelev] * totalunitprice;
    totalinstall = (totalelevprice * gradearr[0]).round(2);
    totalfinal = totalelevprice + totalinstall;
    Quote.create!(
        department: infohash[:buildingtype],
            number_of_floors: infohash[:numberfloors],
            number_of_companies: infohash[:numbercomp],
            number_of_basements: infohash[:numberbase],
            number_of_parking_spots: infohash[:numberpark],
            number_of_elevators: infohash[:numberelev],
            number_of_corporations: infohash[:numbercorp],
            maximum_occupancy: infohash[:maxocc],
            number_of_apartments: infohash[:numberapt],
            business_hours: infohash[:businesshours],
            service_grade: servicegrade,
            elevator_amount: infohash[:totalelev],
            elevator_unit_price: totalunitprice,
            elevator_total_price: totalelevprice,
            installation_fees: totalinstall,
            final_price: totalfinal,
            contact_name: Faker::FunnyName.two_word_name,
            company_name: Faker::Company.name,
            contact_email: Faker::Internet.email,
            date_created: Faker::Time.between(from: 3.years.ago, to: Date.today),
        )
end

puts "-- ___-- Quotes Table Populated with #{Quote.count} records -- ___--"