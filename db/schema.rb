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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110410233211) do

  create_table "awards", :force => true do |t|
    t.integer  "ribbon_id"
    t.integer  "cadet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cadets", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "platoon"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "middle_name"
    t.integer  "class_year"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.text     "description"
    t.integer  "cadet_in_charge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "longitude"
    t.float    "latitude"
  end

  create_table "hours", :force => true do |t|
    t.integer  "roster_id"
    t.integer  "award_id"
    t.integer  "num_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ribbons", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "seniority"
    t.integer  "num_hours"
    t.integer  "num_events"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_path"
  end

  create_table "rosters", :force => true do |t|
    t.integer  "event_id"
    t.integer  "cadet_id"
    t.time     "sign_in_time"
    t.time     "sign_out_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
