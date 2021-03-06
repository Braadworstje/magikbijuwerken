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

ActiveRecord::Schema.define(version: 20140122093813) do

  create_table "news", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.text     "faq"
    t.text     "terms"
    t.text     "company"
    t.text     "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qualities", force: true do |t|
    t.string   "quality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "skill"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_vacancies", force: true do |t|
    t.integer  "user_id"
    t.integer  "vacancy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "finished",   default: false
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",             default: false, null: false
    t.string   "address"
    t.string   "image"
    t.string   "municipal"
    t.string   "pdf"
    t.string   "cv"
    t.boolean  "accepted",          default: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "municipal_contact"
    t.string   "telephone_number"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "users_qualities_skills", force: true do |t|
    t.integer "user_id"
    t.integer "quality_id"
    t.integer "skill_id"
  end

  create_table "vacancies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.string   "name"
    t.string   "email"
    t.integer  "telephone_number"
    t.string   "requirements"
    t.string   "address"
    t.string   "image"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "vacancies_qualities_skills", force: true do |t|
    t.integer "vacancy_id"
    t.integer "quality_id"
    t.integer "skill_id"
  end

end
