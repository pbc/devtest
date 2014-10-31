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

ActiveRecord::Schema.define(version: 20141030222725) do

  create_table "countries", force: true do |t|
    t.string   "country_code",      default: "", null: false
    t.integer  "panel_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["country_code"], name: "index_countries_on_country_code"

  create_table "countries_location_groups", force: true do |t|
    t.integer "country_id"
    t.integer "location_group_id"
  end

  add_index "countries_location_groups", ["country_id"], name: "index_countries_location_groups_on_country_id"
  add_index "countries_location_groups", ["location_group_id"], name: "index_countries_location_groups_on_location_group_id"

  create_table "countries_target_groups", force: true do |t|
    t.integer "country_id"
    t.integer "target_group_id"
  end

  add_index "countries_target_groups", ["country_id"], name: "index_countries_target_groups_on_country_id"
  add_index "countries_target_groups", ["target_group_id"], name: "index_countries_target_groups_on_target_group_id"

  create_table "location_groups", force: true do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name",        default: "", null: false
    t.integer  "external_id"
    t.string   "secret_code", default: ""
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations_location_groups", force: true do |t|
    t.integer "location_id"
    t.integer "location_group_id"
  end

  add_index "locations_location_groups", ["location_group_id"], name: "index_locations_location_groups_on_location_group_id"
  add_index "locations_location_groups", ["location_id"], name: "index_locations_location_groups_on_location_id"

  create_table "panel_providers", force: true do |t|
    t.string   "code",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "target_groups", force: true do |t|
    t.string   "name",        default: "", null: false
    t.integer  "external_id"
    t.integer  "parent_id"
    t.string   "secret_code", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
