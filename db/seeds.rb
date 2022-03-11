# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'Employee_List.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    e = Employee.new
    e.first_name = row['first_name']
    e.last_name = row['last_name']
    e.title = row['title']
    e.email = row['email']
    if e.save
        puts "#{e.last_name} saved."
    end
end

puts "There are now #{Employee.count} rows in the transactions table."
#User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?