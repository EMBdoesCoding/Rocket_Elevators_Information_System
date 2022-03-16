# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Employee.delete_all
# User.delete_all
# AdminUser.delete_all

# require 'csv'
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Employee_List.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#     user = User.create!(
#         email: row['email'],
#         password: 'password'
#     )

#     AdminUser.create!(
#         email: row['email'],
#         password: 'password'
#     )

#     Employee.create!(
#         first_name: row['first_name'],
#         last_name: row['last_name'],
#         title: row['title'],
#         email: row['email'],
#         user: user
#     )
# end

# puts "There are now #{Employee.count} rows in the transactions table."

TempTable.create!(name: "John")

puts "Seed Done!"