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

ActiveRecord::Schema.define(version: 20130818084809) do

  create_table "chronicles", force: true do |t|
    t.date     "date"
    t.text     "summary"
    t.string   "mood"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meals", force: true do |t|
    t.datetime "datetime"
    t.string   "where"
    t.string   "kind"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.datetime "datetime"
    t.string   "category"
    t.string   "method"
    t.boolean  "shared"
    t.string   "description"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
