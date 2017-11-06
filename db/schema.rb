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

ActiveRecord::Schema.define(version: 20171106090157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bus_services", force: :cascade do |t|
    t.string "service_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_number"], name: "index_bus_services_on_service_number"
  end

  create_table "bus_services_stops", id: false, force: :cascade do |t|
    t.bigint "bus_stop_id", null: false
    t.bigint "bus_service_id", null: false
    t.index ["bus_service_id", "bus_stop_id"], name: "index_bus_services_stops_on_bus_service_id_and_bus_stop_id"
    t.index ["bus_stop_id", "bus_service_id"], name: "index_bus_services_stops_on_bus_stop_id_and_bus_service_id"
  end

  create_table "bus_stops", force: :cascade do |t|
    t.string "stop_number", null: false
    t.float "longitude", null: false
    t.float "latitude", null: false
    t.string "stop_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stop_number"], name: "index_bus_stops_on_stop_number"
  end

end
