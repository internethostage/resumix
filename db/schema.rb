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

ActiveRecord::Schema.define(version: 20160527024624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "resume_snippets", force: :cascade do |t|
    t.integer  "position"
    t.integer  "resume_id"
    t.integer  "snippet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resume_snippets", ["resume_id"], name: "index_resume_snippets_on_resume_id", using: :btree
  add_index "resume_snippets", ["snippet_id"], name: "index_resume_snippets_on_snippet_id", using: :btree

  create_table "resumes", force: :cascade do |t|
    t.string   "name"
    t.integer  "template"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resumes", ["user_id"], name: "index_resumes_on_user_id", using: :btree

  create_table "snippets", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.hstore   "properties"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "version_of_id"
  end

  add_index "snippets", ["properties"], name: "index_snippets_on_properties", using: :gin
  add_index "snippets", ["user_id"], name: "index_snippets_on_user_id", using: :btree
  add_index "snippets", ["version_of_id"], name: "index_snippets_on_version_of_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "uid"
    t.string   "provider"
    t.text     "auth_raw_data"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "resume_snippets", "resumes"
  add_foreign_key "resume_snippets", "snippets"
  add_foreign_key "resumes", "users"
  add_foreign_key "snippets", "snippets", column: "version_of_id"
  add_foreign_key "snippets", "users"
end
