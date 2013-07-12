# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130712205530) do

  create_table "locations", force: true do |t|
    t.string   "name"
    t.integer  "store_number"
    t.string   "phone_number"
    t.string   "street_line_1"
    t.string   "street_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country_code"
    t.decimal  "latitude",      precision: 15, scale: 10
    t.decimal  "longitude",     precision: 15, scale: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["store_number"], name: "index_locations_on_store_number", unique: true

end
