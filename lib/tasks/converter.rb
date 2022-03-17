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

quotes.all.each do |//row|
    FactQuote.create!(

    )