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

ActiveRecord::Schema.define(version: 20151025221153) do

  create_table "students", force: :cascade do |t|
    t.string   "first_name",        null: false
    t.string   "last_name",         null: false
    t.integer  "graduation_year",   null: false
    t.integer  "osis"
    t.integer  "sark",              null: false
    t.string   "email",             null: false
    t.string   "phone"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "parent_email"
    t.string   "parent_home_phone"
    t.string   "parent_cell_phone"
    t.integer  "team_id"
  end

  add_index "students", ["email"], name: "index_students_on_email"
  add_index "students", ["father_name"], name: "index_students_on_father_name"
  add_index "students", ["first_name"], name: "index_students_on_first_name"
  add_index "students", ["graduation_year"], name: "index_students_on_graduation_year"
  add_index "students", ["last_name"], name: "index_students_on_last_name"
  add_index "students", ["mother_name"], name: "index_students_on_mother_name"
  add_index "students", ["osis"], name: "index_students_on_osis", unique: true
  add_index "students", ["parent_cell_phone"], name: "index_students_on_parent_cell_phone"
  add_index "students", ["parent_email"], name: "index_students_on_parent_email"
  add_index "students", ["parent_home_phone"], name: "index_students_on_parent_home_phone"
  add_index "students", ["phone"], name: "index_students_on_phone"
  add_index "students", ["sark"], name: "index_students_on_sark"
  add_index "students", ["team_id"], name: "index_students_on_team_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "division",   null: false
    t.integer  "number",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["division"], name: "index_teams_on_division"
  add_index "teams", ["name"], name: "index_teams_on_name"
  add_index "teams", ["number"], name: "index_teams_on_number"

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
