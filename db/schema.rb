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

ActiveRecord::Schema[7.1].define(version: 2024_03_18_170614) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dial_guesses", force: :cascade do |t|
    t.integer "points"
    t.integer "guessed_value"
    t.bigint "set_dial_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["set_dial_id"], name: "index_dial_guesses_on_set_dial_id"
    t.index ["user_id"], name: "index_dial_guesses_on_user_id"
  end

  create_table "dials", force: :cascade do |t|
    t.string "left"
    t.string "right"
    t.bigint "topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_dials_on_topic_id"
  end

  create_table "games", force: :cascade do |t|
    t.boolean "status", default: false
    t.bigint "group_id", null: false
    t.bigint "topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_games_on_group_id"
    t.index ["topic_id"], name: "index_games_on_topic_id"
  end

  create_table "group_subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_subscriptions_on_group_id"
    t.index ["user_id"], name: "index_group_subscriptions_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_messages_on_group_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "set_dials", force: :cascade do |t|
    t.integer "setter_value"
    t.string "setter_word"
    t.bigint "dial_id", null: false
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dial_id"], name: "index_set_dials_on_dial_id"
    t.index ["game_id"], name: "index_set_dials_on_game_id"
    t.index ["user_id"], name: "index_set_dials_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "dial_guesses", "set_dials"
  add_foreign_key "dial_guesses", "users"
  add_foreign_key "dials", "topics"
  add_foreign_key "games", "groups"
  add_foreign_key "games", "topics"
  add_foreign_key "group_subscriptions", "groups"
  add_foreign_key "group_subscriptions", "users"
  add_foreign_key "messages", "groups"
  add_foreign_key "messages", "users"
  add_foreign_key "set_dials", "dials"
  add_foreign_key "set_dials", "games"
  add_foreign_key "set_dials", "users"
end
