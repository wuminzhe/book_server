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

ActiveRecord::Schema.define(version: 20131224064610) do

  create_table "activities", force: true do |t|
    t.string   "title"
    t.integer  "klass_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year"
  end

  create_table "administrators", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frames", force: true do |t|
    t.string   "src"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "klasses", force: true do |t|
    t.string   "name"
    t.integer  "grade"
    t.integer  "number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photo_books", force: true do |t|
    t.integer  "student_id"
    t.integer  "template_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.string   "year"
    t.integer  "used"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "src"
    t.integer  "klass_id"
  end

  add_index "pictures", ["activity_id"], name: "index_pictures_on_activity_id"

  create_table "stickers", force: true do |t|
    t.string   "src"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_picture_associations", force: true do |t|
    t.integer  "student_id"
    t.integer  "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_picture_associations", ["picture_id"], name: "index_student_picture_associations_on_picture_id"
  add_index "student_picture_associations", ["student_id"], name: "index_student_picture_associations_on_student_id"

  create_table "students", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.integer  "klass_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.string   "avatar"
  end

  add_index "students", ["klass_id"], name: "index_students_on_klass_id"
  add_index "students", ["phone"], name: "index_students_on_phone", unique: true

  create_table "templates", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
