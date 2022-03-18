#!/usr/bin/ruby
# frozen_string_literal: true

require 'mysql2'
require 'pg'

def self.move_quote
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

def self.move_contacts
    Lead.all.each do |l|
        FactContact.create!(
            {
            contact_id: l.id,
            created_at: l.created_at,
            company_name: l.company_name,
            email: l.email,
            project_name: l.project_name
            }
        )
    end
end

def self.move_elevators
    Elevators.all.each do |e|
        FactElevators.create!(
            {
            serial_number: e.serial_number
            commission_date: e.commission_date
            building_id: e.building_id
            customer_id: e.customer_id
            city: e.city
            }
        )
    end
end

def self.move_customers
    Customers.all.each do |c|
        DimCustomers.create!(
            {
            created_at: c.created_at
            company_contact_name: c.company_contact_name
            company_contact_phone: c.company_contact_phone
            company_contact_email: c.company_contact_email
            elevator_number = 0
                Building.each do |building|
                    Battery.each do |battery|
                        Column.each do |column|
                            elevator_number += elevators.length
            customers_city: c.customers_city
            }
        )
    end
end