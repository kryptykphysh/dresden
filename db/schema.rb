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

ActiveRecord::Schema.define(version: 20140129113807) do

  create_table "aspects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "aspects", ["name"], name: "index_aspects_on_name", unique: true

  create_table "campaigns", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gamemaster_id"
    t.integer  "power_level_id"
  end

  add_index "campaigns", ["gamemaster_id"], name: "index_campaigns_on_gamemaster_id"

  create_table "campaigns_players", id: false, force: true do |t|
    t.integer "campaign_id"
    t.integer "user_id"
  end

  add_index "campaigns_players", ["campaign_id", "user_id"], name: "index_campaigns_players_on_campaign_id_and_user_id", unique: true

  create_table "character_phases", force: true do |t|
    t.integer  "phase_id"
    t.integer  "character_id"
    t.integer  "aspect_id"
    t.text     "content"
    t.integer  "guest_star_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "character_phases", ["character_id", "phase_id"], name: "index_character_phases_on_character_id_and_phase_id", unique: true

  create_table "characters", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "high_concept_id"
    t.integer  "trouble"
    t.integer  "campaign_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "played_by_id"
  end

  add_index "characters", ["name"], name: "index_characters_on_name", unique: true

  create_table "phases", force: true do |t|
    t.string   "name"
    t.string   "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "power_levels", force: true do |t|
    t.string   "name"
    t.integer  "refresh"
    t.integer  "skill_points"
    t.integer  "skill_cap_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "skill_levels", force: true do |t|
    t.string   "name"
    t.integer  "modifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
