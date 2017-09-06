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

ActiveRecord::Schema.define(version: 20170906204330) do

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.date "date", null: false
    t.integer "valid_year", null: false
    t.float "default_hours", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_events_on_date"
    t.index ["name"], name: "index_events_on_name"
    t.index ["valid_year"], name: "index_events_on_valid_year"
  end

  create_table "media_consents", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_media_consents_on_student_id"
    t.index ["year"], name: "index_media_consents_on_year"
  end

  create_table "medicals", force: :cascade do |t|
    t.date "date", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_medicals_on_date"
    t.index ["student_id"], name: "index_medicals_on_student_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email"
    t.string "phone", null: false
    t.string "preferred_language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_parents_on_email"
    t.index ["first_name"], name: "index_parents_on_first_name"
    t.index ["last_name"], name: "index_parents_on_last_name"
    t.index ["phone"], name: "index_parents_on_phone"
    t.index ["preferred_language"], name: "index_parents_on_preferred_language"
  end

  create_table "parents_students", id: false, force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "parent_id", null: false
    t.index ["parent_id", "student_id"], name: "index_parents_students_on_parent_id_and_student_id"
    t.index ["student_id", "parent_id"], name: "index_parents_students_on_student_id_and_parent_id"
  end

  create_table "services", force: :cascade do |t|
    t.integer "student_id"
    t.integer "event_id"
    t.float "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_services_on_event_id"
    t.index ["student_id"], name: "index_services_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "preferred_name"
    t.integer "grad_year", null: false
    t.integer "osis", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["first_name"], name: "index_students_on_first_name"
    t.index ["grad_year"], name: "index_students_on_grad_year"
    t.index ["last_name"], name: "index_students_on_last_name"
    t.index ["osis"], name: "index_students_on_osis", unique: true
    t.index ["phone"], name: "index_students_on_phone"
    t.index ["preferred_name"], name: "index_students_on_preferred_name"
    t.index ["team_id"], name: "index_students_on_team_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "team_dues", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_team_dues_on_student_id"
    t.index ["year"], name: "index_team_dues_on_year"
  end

  create_table "teams", force: :cascade do |t|
    t.string "program", null: false
    t.integer "number", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
