# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_04_042135) do

  create_table "doctors", force: :cascade do |t|
    t.integer "healthcareprovider_id"
    t.integer "user_id"
    t.string "title"
  end

  create_table "healthcareproviders", force: :cascade do |t|
    t.string "name"
  end

  create_table "healthcareteams", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "doctor_id"
    t.integer "healthcareprovider_id"
    t.string "department"
    t.datetime "appointment"
    t.text "test_result"
    t.text "treatment_plans"
    t.text "prescriptions"
    t.decimal "billing"
  end

  create_table "patients", force: :cascade do |t|
    t.integer "healthcareprovider_id"
    t.integer "user_id"
    t.text "medical_record"
    t.text "test_results"
    t.text "medications"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "firstname"
    t.string "lastname"
  end

end
