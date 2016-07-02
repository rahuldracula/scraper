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

ActiveRecord::Schema.define(version: 20160702122903) do

  create_table "routes", force: :cascade do |t|
    t.string   "from_city",    limit: 255
    t.string   "to_city",      limit: 255
    t.integer  "from_city_id", limit: 4
    t.integer  "to_city_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "shots", force: :cascade do |t|
    t.string   "from_city",         limit: 255
    t.string   "to_city",           limit: 255
    t.string   "travel_date",       limit: 255
    t.string   "rb_pref_code",      limit: 255
    t.string   "is_bp_dp_search",   limit: 255
    t.string   "j_dur",             limit: 255
    t.string   "service_id",        limit: 255
    t.string   "service_name",      limit: 255
    t.string   "vehicle_type",      limit: 255
    t.string   "is_dpa",            limit: 255
    t.string   "boarding_location", limit: 255
    t.string   "boarding_points",   limit: 255
    t.string   "drop_location",     limit: 255
    t.string   "drop_points",       limit: 255
    t.datetime "arrival_time"
    t.string   "bus_type",          limit: 255
    t.datetime "departure_time"
    t.string   "fare",              limit: 255
    t.string   "ac",                limit: 255
    t.string   "not_ac",            limit: 255
    t.string   "seater",            limit: 255
    t.string   "sleeper",           limit: 255
    t.string   "is_spf",            limit: 255
    t.string   "is_mte",            limit: 255
    t.string   "seats_available",   limit: 255
    t.string   "window_seats",      limit: 255
    t.string   "operator_id",       limit: 255
    t.string   "rt_id",             limit: 255
    t.string   "operator",          limit: 255
    t.string   "rating",            limit: 255
    t.string   "rating_count",      limit: 255
    t.string   "tips",              limit: 255
    t.string   "glry",              limit: 255
    t.string   "sort",              limit: 255
    t.string   "bs_st",             limit: 255
    t.string   "bs_sv_id",          limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end
