# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_27_222556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_hists", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.boolean "sign_in"
    t.integer "point_recv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "event_id"
    t.string "event_name"
    t.string "event_type"
    t.datetime "event_date"
    t.string "description"
    t.integer "event_creator"
    t.boolean "virtual"
    t.string "password"
    t.string "meeting_link"
    t.datetime "signin_time"
    t.integer "point_val"
    t.string "graphics"
    t.float "total_event_hr"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "poin_events", force: :cascade do |t|
    t.integer "user_id"
    t.integer "balance"
    t.datetime "date"
    t.string "description"
    t.integer "admin_award_id"
    t.float "hours_attend"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "referrals", force: :cascade do |t|
    t.integer "old_member"
    t.integer "new_member"
    t.string "guest_first_name"
    t.string "guest_last_name"
    t.boolean "medical_prof"
    t.string "email"
    t.datetime "date_referred"
    t.string "admin_approved"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "user_id"
    t.string "major"
    t.boolean "admin", default: false
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "avatar_url"
    t.string "password"
    t.boolean "ismember"
    t.datetime "birthdate"
    t.text "bio"
    t.integer "signInCount", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
