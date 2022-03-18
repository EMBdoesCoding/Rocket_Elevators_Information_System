#!/usr/bin/ruby
# frozen_string_literal: true

require 'mysql2'
require 'pg'

class DBConnection
  def pg_connect
    PG.connect( :hostaddr=>"localhost", :port=>5432, 
      :dbname=>"database", :user=>"postgres_user", :password=>'postgres_password')
  end
  
  def mysql_connect
    Mysql2::Client.new(:host => "localhost", :username => "root",
      :password => "Lare1213!", :database => "database")
  end
end

def self.move_quote
    Quote.all.each do |q|
      FactQuote.create!(
        {
          quote_id: q.id,
          quote_created_at: q.created_at,
          company_name: customer.company_name,
          email: user.email,
          elevator_number: q.elevator_number
        }
      )
    end
end

def self.move_contacts
    Lead.all.each do |l|
      FactContact.create!(
        {
          contact_id: l.id,
          creation_date: l.created_at,
          company_name: l.company_name,
          email: l.email,
          project_name: l.project_name
        }
      )
    end
  end

def self.move_customers
    Customers.all.each do |c|
        DimCustomers.create!(
            {
            company_name: c.
            company_main_contact: c.
            company_main_email: c.
            num_elevators: c.
            customers_city: c.
            }
        )
    end
end

def self.move_elevators
    elevators.all.each do |e|
        FactElevators.create!(
            {
            serial_num: e.
            date_of_commision: e.
            building_id: e.
            customer_id: e.
            building_city: e.
        }
    )
    end
end
