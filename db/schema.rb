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

ActiveRecord::Schema.define(version: 20151101222159) do

  create_table "favorite_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "todo_list_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "favorite_lists", ["todo_list_id"], name: "index_favorite_lists_on_todo_list_id"
  add_index "favorite_lists", ["user_id", "todo_list_id"], name: "index_favorite_lists_on_user_id_and_todo_list_id", unique: true
  add_index "favorite_lists", ["user_id"], name: "index_favorite_lists_on_user_id"

  create_table "list_items", force: :cascade do |t|
    t.string  "name",         default: "", null: false
    t.integer "todo_list_id"
  end

  add_index "list_items", ["todo_list_id"], name: "index_list_items_on_todo_list_id"

  create_table "todo_lists", force: :cascade do |t|
    t.string   "name",       default: "",    null: false
    t.boolean  "is_private", default: false, null: false
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "todo_lists", ["user_id"], name: "index_todo_lists_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
