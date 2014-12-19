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

ActiveRecord::Schema.define(version: 20141218153858) do

  create_table "areas", force: true do |t|
    t.string  "postal_code",                 null: false
    t.integer "prefectural_id"
    t.string  "city",           default: ""
    t.string  "street",         default: ""
  end

  add_index "areas", ["prefectural_id"], name: "index_areas_on_prefectural_id"

  create_table "courses", force: true do |t|
    t.integer  "department_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["department_id"], name: "index_courses_on_department_id"

  create_table "departments", force: true do |t|
    t.integer "school_id"
    t.string  "name"
    t.string  "en"
    t.string  "short"
  end

  add_index "departments", ["school_id"], name: "index_departments_on_school_id"

  create_table "laboratories", force: true do |t|
    t.integer "department_id"
    t.string  "name"
    t.string  "teacher"
  end

  add_index "laboratories", ["department_id"], name: "index_laboratories_on_department_id"

  create_table "prefecturals", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string "name"
    t.string "en"
    t.string "short"
  end

end
