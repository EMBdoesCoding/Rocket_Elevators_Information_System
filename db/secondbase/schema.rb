# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_15_200003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dimcustomers", id: false, force: :cascade do |t|
    t.datetime "creation_date"
    t.integer "company_name"
    t.integer "company_main_contact"
    t.integer "company_main_email"
    t.integer "num_elevators"
    t.integer "customers_city"
  end

  create_table "factelevator", id: false, force: :cascade do |t|
    t.integer "serial_number"
    t.datetime "date_of_commision"
    t.integer "building_id"
    t.integer "customer_id"
    t.integer "building_city"
  end

  create_table "widgets_tables", force: :cascade do |t|
  end

end
