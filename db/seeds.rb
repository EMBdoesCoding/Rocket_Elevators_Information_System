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
randomarray = Array.new(address_parse['address'].count) {|e| e += 1};
arandom = randomarray.shuffle;
counter = 0;

#-------Generate real addresses---------
65.times do
    Address.create!(
        type_of_address: ["Home","Business", "Shipping", "Billing"].sample,
        status: ["Verified", "Unverified"].sample,
        entity: ["Customer", "Business"].sample,
        number_street: address_parse['address'][arandom[counter]]['address1'],
        suite_apartment: address_parse['address'][arandom[counter]]['address2'],
        city:address_parse['address'][arandom[counter]]['city'],
        postal_code:address_parse['address'][arandom[counter]]['postalCode'],
        country: "USA",
        notes:  Faker::Lorem.paragraph,
    )
    counter += 1
end
puts "-- ___-- Real Address Table Populated with #{Address.count} records -- ___--"

# ----------generate random leads---------
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
puts "-- ___-- Lead Table Populated with #{Lead.count} records -- ___--"

#----------generate random customers--------
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
puts "-- ___-- Customer Table Populated with #{Customer.count} records -- ___--"

#-------generate random buildings--------
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
puts "-- ___-- Building Table Populated with #{Building.count} records -- ___--"

#-------Generate random batteries-------
15.times do 
    Battery.create!(        
        building_id:    Faker::Number.between(from: 1, to: 28),
        building_type:   ["Residential", "Commercial","Corporate", "Hybrid"].sample,
        status: ["Running", "Not Running"].sample,
        employee_id: Faker::Number.between(from: Employee.first.id, to: (Employee.first.id+Employee.count-1)),
        commission_date:    Faker::Date.between(from: 3.years.ago, to: Date.today),
        last_inspection_date:   Faker::Date.between(from: 3.years.ago, to: Date.today),
        certificate_of_operations:  Faker::Code.rut,
        information:    Faker::Lorem.sentence,
        notes:  Faker::Lorem.paragraph,
    )
end
puts "-- ___-- Battery Table Populated with #{Battery.count} records -- ___--"

#---------generate random columns---------
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
puts "-- ___-- Column Table Populated with #{Column.count} records -- ___--"

#--------generate random elevators---------
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
    puts "-- ___-- Elevator Table Populated with #{Elevator.count} records -- ___--"

    
    
    info_key_array = ["Type", "Construction Year", "Number of Elevators Inside", "Maximum Number of Occupants", "Renovation Year"]
    info_value_array = [["Residential", "Commercial","Corporate", "Hybrid"].sample, Faker::Date.between(from: '1954-01-01', to: '2022-03-16'), Faker::Number.between(from: 1, to: 12), Faker::Number.between(from: 1, to: 300), Faker::Date.between(from: '1954-01-01', to: '2022-03-16') ]
    
    #--------generate random building details
    28.times do  
        x = rand(5)
        BuildingDetail.create!(        
            building_id:    Faker::Number.between(from: 1, to: 28),
            info_key:   info_key_array[x],
            value:  [["Residential", "Commercial","Corporate", "Hybrid"].sample, Faker::Date.between(from: '1954-01-01', to: '2022-03-16'), Faker::Number.between(from: 1, to: 12), Faker::Number.between(from: 1, to: 300), Faker::Date.between(from: '1954-01-01', to: '2022-03-16') ][x],
        )
    end

puts "-- ___-- Building Details Table Populated with #{BuildingDetail.count} records -- ___--"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

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
<<<<<<< HEAD
            # Faker::Date.between(from: 3.years.ago, to: Date.today)
            )
        end

        puts "-- ___-- Quotes Table Populated with #{Quote.count} records -- ___--"




        
        
        
        #---------------Generate randm quotes
        
        # #---Residential random quotes
        # 89.times do
        
        #     typeOfBuilding = "Residential"
        #     numberOfFloors = Faker::Number.between(from: 2, to: 100)
        #     # numberOfCompanies = Faker::Number.between(from: 1, to: 25)
        #     numberOfBasements = Faker::Number.between(from: 1, to: 6)
        #     # numberOfParkingSpots = Faker::Number.between(from: 1, to: 35)
        #     # numberOfElevatorCages = Faker::Number.between(from: 1, to: 45)
        #     # numberOfCorporations = Faker::Number.between(from: 1, to: 15)
        #     # numberOfOccupants = Faker::Number.between(from: 1, to: 300)
        #     numberOfAppartments = Faker::Number.between(from: 1, to: 800)
        #     # buisnessHours = Faker::Number.between(from: 1, to: 24)
        #     productServiceType = ["Standard", "Premium", "Excelium"].sample
        
        #     averagePerFloor = numberOfAppartments/numberOfFloors
        #     result = averagePerFloor/6
        #     columnsNeeded = numberOfFloors/20
        #     requiredElevators = result *columnsNeeded
        
        
        #     if productServiceType = "Standard"
        #         elevatorUnitPrice = 7565
        #         productServiceTypeFee = 0.10
        #         totalInstallFee = elevatorUnitPrice * productServiceTypeFee
                 
        #     elsif productServiceType = "Premium" 
        #         elevatorUnitPrice = 12345
        #         productServiceTypeFee = 0.13
        #         totalInstallFee = elevatorUnitPrice * productServiceTypeFee
        #     elsif productServiceType = "Excelium"
        #         elevatorUnitPrice = 15400
        #         productServiceTypeFee = 0.16
        #         totalInstallFee = elevatorUnitPrice * productServiceTypeFee
        
        #     end
        
        #     elevatorTotalPrice = elevatorUnitPrice * requiredElevators
        
        #     Quote.create!(
        
        #         department: typeOfBuilding,
        #         number_of_floors: numberOfFloors,
        #         # number_of_companies: numberOfCompanies,
        #         number_of_basements: numberOfBasements,
        #         # number_of_parking_spots: numberOfParkingSpots,
        #         # number_of_elevators: numberOfElevatorCages,
        #         # number_of_corporations: numberOfCorporations,
        #         # maximum_occupancy: numberOfOccupants,
        #         number_of_apartments: numberOfAppartments,
        #         # business_hours: businessHours,
        #         service_grade: productServiceType,
        #         elevator_amount: requiredElevators,
        #         elevator_unit_price: elevatorUnitPrice,
        #         elevator_total_price: elevatorTotalPrice,
        #         installation_fees: totalInstallFee,
        #         final_price: totalInstallFee + elevatorTotalPrice,
        
        #     )
        # end
        # puts "-- ___-- Residential Quotes Populated -- ___--"
        
        
        #---Commercial random quotes
        # 71.times do
        
        #     typeOfBuilding = "Commercial"
        #     numberOfFloors = Faker::Number.between(from: 2, to: 100)
        #     numberOfCompanies = Faker::Number.between(from: 1, to: 25)
        #     numberOfBasements = Faker::Number.between(from: 1, to: 6)
        #     numberOfParkingSpots = Faker::Number.between(from: 1, to: 35)
        #     numberOfElevatorCages = Faker::Number.between(from: 1, to: 45)
        #     # numberOfCorporations = Faker::Number.between(from: 1, to: 15)
        #     # numberOfOccupants = Faker::Number.between(from: 1, to: 300)
        #     # numberOfAppartments = Faker::Number.between(from: 1, to: 800)
        #     # businessHours = Faker::Number.between(from: 1, to: 24)
        #     productServiceType = ["Standard", "Premium", "Excelium"].sample
        
            
        
        #     # averagePerFloor = numberOfAppartments/numberOfFloors
        
        #     if productServiceType = "Standard"
        #         elevatorUnitPrice = 7565
        #         productServiceTypeFee = 0.10
        #         totalFee = elevatorUnitPrice * productServiceTypeFee
                 
        #     elsif productServiceType = "Premium" 
        #         elevatorUnitPrice = 12345
        #         productServiceTypeFee = 0.13
        #         totalFee = elevatorUnitPrice * productServiceTypeFee
        
        #     elsif productServiceType = "Excelium"
        #         elevatorUnitPrice = 15400
        #         productServiceTypeFee = 0.16
        #         totalFee = elevatorUnitPrice * productServiceTypeFee
        
        #     end
        
        #     elevatorTotalPrice = elevatorUnitPrice * numberOfElevatorCages
        
        #     Quote.create!(
        
        #         department: typeOfBuilding,
        #         number_of_floors: numberOfFloors,
        #         number_of_companies: numberOfCompanies,
        #         number_of_basements: numberOfBasements,
        #         number_of_parking_spots: numberOfParkingSpots,
        #         number_of_elevators: numberOfElevatorCages,
        #         # number_of_corporations: numberOfCorporations,
        #         # maximum_occupancy: numberOfOccupants,
        #         # number_of_apartments: numberOfAppartments,
        #         # business_hours: businessHours,
        #         service_grade: productServiceType,
        #         elevator_amount: amountOfElevatorsNeeded,
        #         elevator_unit_price: elevatorUnitPrice,
        #         elevator_total_price: elevatorTotalPrice,
        #         installation_fees: totalFee,
        #         final_price: totalFee + elevatorTotalPrice,
        
        #     )
        # end
        # puts "-- ___-- Commercial Quotes Populated -- ___--"
        
        
        
        # #---Corprate random quotes
        # 60.times do
        
        #     typeOfBuilding = "Corprate"
        #     numberOfFloors = Faker::Number.between(from: 2, to: 100)
        #     # numberOfCompanies = Faker::Number.between(from: 1, to: 25)
        #     numberOfBasements = Faker::Number.between(from: 0, to: 6)
        #     numberOfParkingSpots = Faker::Number.between(from: 1, to: 35)
        #     # numberOfElevatorCages = Faker::Number.between(from: 1, to: 45)
        #     numberOfCorporations = Faker::Number.between(from: 1, to: 15)
        #     numberOfOccupants = Faker::Number.between(from: 5, to: 300)
        #     # numberOfAppartments = Faker::Number.between(from: 1, to: 800)
        #     # businessHours = Faker::Number.between(from: 1, to: 24)
        #     productServiceType = ["Standard", "Premium", "Excelium"].sample
            
        
        #     floorWithBasements = (numberOfFloors + numberOfBasements).ceil
        #     totalOccupancy = (numberOfOccupants * floorWithBasements).ceil
        #     nmbrOfElevators = (totalOccupancy/1000.to_f).ceil
        #     columnsNeeded = (floorWithBasements/20.to_f).ceil
        #     averageElevatorsPerColumn = (nmbrOfElevators/columnsNeeded.to_f).ceil()
        #     amountOfElevatorsNeeded = (averageElevatorsPerColumn/columnsNeeded.to_f).ceil
        
        #     if productServiceType == "Standard"
        #         elevatorUnitPrice = 7565
        #         totalElevatorAmount = (elevatorUnitPrice *amountOfElevatorsNeeded).ceil
        #         totalInstallFee = (totalElevatorAmount * 0.10).ceil
        
                 
        #     elsif productServiceType == "Premium" 
        #         elevatorUnitPrice = 12345
        #         totalElevatorAmount = (elevatorUnitPrice *amountOfElevatorsNeeded).ceil
        #         totalInstallFee = (totalElevatorAmount * 0.13).ceil
        
        #     elsif productServiceType == "Excelium"
        #         elevatorUnitPrice = 15400
        #         totalElevatorAmount = (elevatorUnitPrice*amountOfElevatorsNeeded).ceil
        #         totalInstallFee = (totalElevatorAmount * 0.16).ceil()
        #     end
            
        #     Quote.create!(
        
        #         department: typeOfBuilding,
        #         number_of_floors: numberOfFloors,
        #         # number_of_companies: numberOfCompanies,
        #         number_of_basements: numberOfBasements,
        #         number_of_parking_spots: numberOfParkingSpots,
        #         # number_of_elevators: numberOfElevatorCages,
        #         number_of_corporations: numberOfCorporations,
        #         maximum_occupancy: numberOfOccupants,
        #         # number_of_apartments: numberOfAppartments,
        #         # business_hours: businessHours,
        #         service_grade: productServiceType,
        #         elevator_amount: amountOfElevatorsNeeded,
        #         elevator_unit_price: elevatorUnitPrice,
        #         elevator_total_price: totalElevatorAmount,
        #         installation_fees: totalInstallFee,
        #         final_price: totalInstallFee + totalElevatorAmount,
        
        #     )
        # end
        # puts "-- ___-- Corprate Quotes Populated -- ___--"
        
        # #---Hybrid random quotes
        # 58.times do
        
        #     typeOfBuilding = "Hybrid"
        #     # numberOfFloors = Faker::Number.between(from: 2, to: 100)
        #     numberOfCompanies = Faker::Number.between(from: 1, to: 25)
        #     numberOfBasements = Faker::Number.between(from: 1, to: 6)
        #     numberOfParkingSpots = Faker::Number.between(from: 1, to: 35)
        #     numberOfElevatorCages = Faker::Number.between(from: 1, to: 45)
        #     # numberOfCorporations = Faker::Number.between(from: 1, to: 15)
        #     numberOfOccupants = Faker::Number.between(from: 1, to: 300)
        #     # numberOfAppartments = Faker::Number.between(from: 1, to: 800)
        #     businessHours = Faker::Number.between(from: 1, to: 24)
        #     productServiceType = ["Standard", "Premium", "Excelium"].sample
        #     amountOfElevatorsNeeded = 
        
        #     averagePerFloor = numberOfAppartments/numberOfFloors
        
        #     if productServiceType = "Standard"
        #         elevatorUnitPrice = 7565
        #         productServiceTypeFee = 0.10
        #         totalFee = elevatorUnitPrice * productServiceTypeFee
                 
        #     elsif productServiceType = "Premium" 
        #         elevatorUnitPrice = 12345
        #         productServiceTypeFee = 0.13
        #         totalFee = elevatorUnitPrice * productServiceTypeFee
        
        #     elsif productServiceType = "Excelium"
        #         elevatorUnitPrice = 15400
        #         productServiceTypeFee = 0.16
        #         totalFee = elevatorUnitPrice * productServiceTypeFee
        
        #     end
        
        #     elevatorTotalPrice = elevatorUnitPrice * numberOfElevatorCages
        
        #     Quote.create!(
        
        #         department: typeOfBuilding,
        #         number_of_floors: numberOfFloors,
        #         number_of_companies: numberOfCompanies,
        #         number_of_basements: numberOfBasements,
        #         number_of_parking_spots: numberOfParkingSpots,
        #         # number_of_elevators: numberOfElevatorCages,
        #         # number_of_corporations: numberOfCorporations,
        #         maximum_occupancy: numberOfOccupants,
        #         # number_of_apartments: numberOfAppartments,
        #         business_hours: businessHours,
        #         service_grade: productServiceType,
        #         elevator_amount: amountOfElevatorsNeeded,
        #         elevator_unit_price: elevatorUnitPrice,
        #         elevator_total_price: elevatorTotalPrice,
        #         installation_fees: totalFee,
        #         final_price: totalFee + elevatorTotalPrice,
        
        #     )
        # end
        # puts "-- ___-- Hybrid Quotes Populated -- ___--"
=======
            date_created: Faker::Date.between(from: 3.years.ago, to: Date.today),
        )
end

puts "-- ___-- Quotes Table Populated with #{Quote.count} records -- ___--"
>>>>>>> e84e4a399490584fe9c71bc89e60d3b17218a157
