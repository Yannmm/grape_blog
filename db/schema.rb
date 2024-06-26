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

ActiveRecord::Schema[7.1].define(version: 2024_05_17_093132) do
  create_table "api_keys", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audit_logs", force: :cascade do |t|
    t.string "backtrace"
    t.string "data"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_audit_logs_on_user_id"
  end

  create_table "authentication_tokens", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.index ["user_id"], name: "index_authentication_tokens_on_user_id"
  end

  create_table "code_samples", force: :cascade do |t|
    t.integer "review_id", null: false
    t.text "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_code_samples_on_review_id"
  end

  create_table "pair_programming_sessions", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "host_user_id", null: false
    t.integer "visitor_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_user_id"], name: "index_pair_programming_sessions_on_host_user_id"
    t.index ["project_id"], name: "index_pair_programming_sessions_on_project_id"
    t.index ["visitor_user_id"], name: "index_pair_programming_sessions_on_visitor_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "pair_programming_session_id", null: false
    t.integer "user_id", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pair_programming_session_id"], name: "index_reviews_on_pair_programming_session_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "audit_logs", "users"
  add_foreign_key "authentication_tokens", "users"
  add_foreign_key "code_samples", "reviews"
  add_foreign_key "pair_programming_sessions", "projects"
  add_foreign_key "pair_programming_sessions", "users", column: "host_user_id"
  add_foreign_key "pair_programming_sessions", "users", column: "visitor_user_id"
  add_foreign_key "reviews", "pair_programming_sessions"
  add_foreign_key "reviews", "users"
end
