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

ActiveRecord::Schema.define(version: 20141026194437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: true do |t|
    t.string   "name"
    t.string   "course"
    t.integer  "price"
    t.boolean  "spicy",      default: false
    t.datetime "time_added"
  end

  create_table "orders", force: true do |t|
    t.integer  "food_id"
    t.integer  "party_id"
    t.boolean  "cook_status", default: false
    t.datetime "order_time",  default: '-4712-01-01 00:00:00'
  end

  create_table "parties", force: true do |t|
    t.string   "last_name"
    t.integer  "table_number"
    t.integer  "guests"
    t.boolean  "payment_status", default: false
    t.datetime "checkout_time"
  end

  create_table "users", force: true do |t|
    t.string   "username",      null: false
    t.string   "password_hash", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
