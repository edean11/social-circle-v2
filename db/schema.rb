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

ActiveRecord::Schema.define(version: 20150624164544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "castgroups", force: :cascade do |t|
    t.integer  "cast_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "castgroups", ["cast_id"], name: "index_castgroups_on_cast_id", using: :btree
  add_index "castgroups", ["group_id"], name: "index_castgroups_on_group_id", using: :btree

  create_table "casts", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.datetime "expiration"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "lat"
    t.string   "lon"
    t.string   "time_offset"
  end

  add_index "casts", ["user_id", "created_at"], name: "index_casts_on_user_id_and_created_at", using: :btree
  add_index "casts", ["user_id"], name: "index_casts_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "cast_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["cast_id"], name: "index_comments_on_cast_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "picture"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subscriptions", ["group_id"], name: "index_subscriptions_on_group_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "email",                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "avatar"
    t.string   "home_lat"
    t.string   "home_lon"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

  add_foreign_key "castgroups", "casts"
  add_foreign_key "castgroups", "groups"
  add_foreign_key "casts", "users"
  add_foreign_key "comments", "casts"
  add_foreign_key "comments", "users"
  add_foreign_key "subscriptions", "groups"
  add_foreign_key "subscriptions", "users"
end
