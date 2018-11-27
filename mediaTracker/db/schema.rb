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

ActiveRecord::Schema.define(version: 20181127071238) do

  create_table "books", force: :cascade do |t|
    t.string "author"
  end

  create_table "custom_media_entries", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.integer "custom_medium_id"
    t.index ["custom_medium_id"], name: "index_custom_media_entries_on_custom_medium_id"
  end

  create_table "custom_medias", force: :cascade do |t|
    t.string "type"
  end

  create_table "followers", force: :cascade do |t|
    t.integer "user"
    t.integer "fTarget"
  end

  create_table "general_medias", force: :cascade do |t|
    t.string "name"
    t.datetime "timeStamp"
    t.date "created_at"
    t.date "updated_at"
    t.string "specific_medias_id"
  end

  create_table "history_logs", force: :cascade do |t|
    t.string "historyMessage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "magazines", force: :cascade do |t|
    t.integer "issue"
  end

  create_table "movies", force: :cascade do |t|
    t.string "director"
  end

  create_table "musics", force: :cascade do |t|
    t.string "artist"
    t.string "album"
  end

  create_table "personal_media_parameters", force: :cascade do |t|
    t.integer "score"
    t.string "currentStatus"
    t.boolean "favorite"
    t.text "comments"
    t.string "source"
    t.integer "replay"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "users_id"
    t.string "general_medias_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.binary "wallpaper"
    t.integer "fontSize"
    t.string "font"
    t.binary "profilePicture"
    t.boolean "privacy"
    t.string "fontColor"
  end

  create_table "tv_shows", force: :cascade do |t|
    t.integer "numberOfSeasons"
    t.integer "totalEpisodes"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.datetime "last_log_on"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "video_games", force: :cascade do |t|
    t.string "studio"
    t.string "system"
  end

end
