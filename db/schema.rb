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

ActiveRecord::Schema.define(version: 20140502183213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.string   "title"
    t.date     "date"
    t.integer  "guest_count"
    t.integer  "min_budget"
    t.integer  "max_budget"
    t.string   "location"
    t.text     "details"
    t.string   "planner"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.integer  "user_id"
    t.string   "type_of_event"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

end
