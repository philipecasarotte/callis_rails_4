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

ActiveRecord::Schema.define(version: 20091027001635) do

  create_table "departments", force: true do |t|
    t.string   "name"
    t.string   "permalink"
    t.integer  "users_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "permalink"
    t.text     "body"
    t.date     "happens_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metatags", force: true do |t|
    t.string   "title"
    t.string   "keywords"
    t.string   "metatagable_type"
    t.text     "description"
    t.integer  "metatagable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "name"
    t.string   "permalink"
    t.text     "body"
    t.integer  "parent_id"
    t.integer  "children_count", default: 0
    t.integer  "position",       default: 0
    t.boolean  "is_protected",   default: false, null: false
    t.boolean  "is_hidden",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["permalink"], name: "index_pages_on_permalink", unique: true, using: :btree

  create_table "roles", force: true do |t|
    t.string "name"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "login",                     limit: 40
    t.string   "name",                      limit: 100, default: ""
    t.string   "email",                     limit: 100
    t.string   "crypted_password"
    t.string   "salt",                      limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            limit: 40
    t.datetime "remember_token_expires_at"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.datetime "last_request_at"
    t.date     "birthday"
    t.string   "avatar_file_name"
    t.integer  "avatar_file_size"
    t.string   "avatar_content_type"
    t.datetime "avatar_updated_at"
    t.string   "telephone"
    t.string   "department_id"
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree

end
