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

ActiveRecord::Schema.define(version: 20171202211226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenity_lists", force: :cascade do |t|
    t.boolean "wifi"
    t.integer "user_id"
    t.boolean "coffee"
    t.boolean "computer_desk"
    t.boolean "printer"
    t.boolean "projector"
    t.boolean "microwave"
    t.boolean "kitchen_access"
    t.boolean "tv_screen"
    t.boolean "outdoor_space"
    t.boolean "piano"
    t.boolean "art_space"
    t.boolean "garage"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string  "email"
    t.string  "password"
    t.string  "billing_street_address"
    t.string  "billing_city"
    t.string  "billing_state"
    t.string  "billing_zip_code"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "credit_card_number"
    t.string  "expiration_date"
    t.string  "cvv"
    t.string  "password_digest"
    t.text    "personal_description"
    t.string  "home_street_address"
    t.string  "home_city"
    t.string  "home_state"
    t.string  "home_zip_code"
    t.text    "house_description"
    t.boolean "searchable"
    t.string  "billing_first_name"
    t.string  "billing_last_name"
    t.string  "price"
    t.float   "latitude"
    t.float   "longitude"
    t.string  "profile_picture"
    t.string  "house_picture"
    t.string  "house_images",           default: [], array: true
    t.string  "available_time_start"
    t.float   "latitude"
    t.float   "longitude"
    t.integer "amenity_list_id"
    t.string  "title"
    t.integer "capacity"
    t.string  "available_time_end"
    t.string  "house_images",             default: [], array: true
    t.string  "available_time"
    t.string  "cloud_profile_picture"
    t.string  "cloud_profile_picture_id"
    t.string  "cloud_house_picture"
    t.string  "cloud_house_picture_id"
  end

  add_foreign_key "amenity_lists", "users", on_delete: :cascade
  add_foreign_key "users", "amenity_lists", on_delete: :cascade
end
