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

ActiveRecord::Schema[7.1].define(version: 2024_09_26_233401) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "planning_sessions", force: :cascade do |t|
    t.string "uuid", null: false
    t.string "name"
    t.bigint "owner_id", null: false
    t.decimal "total_votes", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_planning_sessions_on_owner_id"
    t.index ["uuid"], name: "index_planning_sessions_on_uuid", unique: true
  end

  create_table "stories", force: :cascade do |t|
    t.bigint "planning_session_id", null: false
    t.string "title"
    t.integer "status", default: 0
    t.decimal "vote", precision: 5, scale: 2
    t.decimal "vote_average", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planning_session_id"], name: "index_stories_on_planning_session_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
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

  create_table "voter_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "planning_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planning_session_id"], name: "index_voter_users_on_planning_session_id"
    t.index ["user_id", "planning_session_id"], name: "index_voter_users_on_user_id_and_planning_session_id", unique: true
    t.index ["user_id"], name: "index_voter_users_on_user_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "voter_user_id", null: false
    t.bigint "story_id", null: false
    t.decimal "vote", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_votes_on_story_id"
    t.index ["voter_user_id", "story_id"], name: "index_votes_on_voter_user_id_and_story_id", unique: true
    t.index ["voter_user_id"], name: "index_votes_on_voter_user_id"
  end

  add_foreign_key "planning_sessions", "users", column: "owner_id"
  add_foreign_key "stories", "planning_sessions"
  add_foreign_key "voter_users", "planning_sessions"
  add_foreign_key "voter_users", "users"
  add_foreign_key "votes", "stories"
  add_foreign_key "votes", "voter_users"
end
