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

ActiveRecord::Schema.define(version: 20130922103511) do

  create_table "challenges", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "challenges", ["user_id"], name: "index_challenges_on_user_id"

  create_table "chronicles", force: true do |t|
    t.date     "date"
    t.text     "summary"
    t.string   "mood"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "chronicles", ["user_id"], name: "index_chronicles_on_user_id"

  create_table "meals", force: true do |t|
    t.datetime "datetime"
    t.string   "where"
    t.string   "kind"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "meals", ["user_id"], name: "index_meals_on_user_id"

  create_table "milestones", force: true do |t|
    t.integer  "challenge_id"
    t.date     "date"
    t.boolean  "completed",    default: false
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "milestones", ["challenge_id"], name: "index_milestones_on_challenge_id"

  create_table "payments", force: true do |t|
    t.datetime "datetime"
    t.string   "category"
    t.string   "method"
    t.boolean  "shared"
    t.string   "description"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "accountable_for"
  end

  add_index "payments", ["user_id"], name: "index_payments_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "use_meals",              default: true
    t.boolean  "use_payments",           default: true
    t.boolean  "use_workouts",           default: true
    t.boolean  "use_chronicles",         default: true
    t.boolean  "use_challenges",         default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "workouts", force: true do |t|
    t.datetime "datetime"
    t.integer  "duration",   default: 0
    t.string   "sport"
    t.string   "where"
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id"

end
