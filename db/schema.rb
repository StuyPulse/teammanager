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

ActiveRecord::Schema.define(version: 20151025180351) do

  create_table "students", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.integer  "graduation_year", null: false
    t.integer  "osis",            null: false
    t.integer  "sark",            null: false
    t.string   "email",           null: false
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "students", ["email"], name: "index_students_on_email"
  add_index "students", ["first_name"], name: "index_students_on_first_name"
  add_index "students", ["graduation_year"], name: "index_students_on_graduation_year"
  add_index "students", ["last_name"], name: "index_students_on_last_name"
  add_index "students", ["osis"], name: "index_students_on_osis", unique: true
  add_index "students", ["phone"], name: "index_students_on_phone"
  add_index "students", ["sark"], name: "index_students_on_sark"

end
