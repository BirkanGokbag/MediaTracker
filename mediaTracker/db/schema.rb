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

ActiveRecord::Schema.define(version: 20181119222127) do

  create_table "books", force: :cascade do |t|
    t.string "author"
    t.integer "general_medias_id"
    t.index ["general_medias_id"], name: "index_books_on_general_medias_id"
  end

  create_table "custom_media_entries", force: :cascade do |t|
    t.string "key"
    t.string "value"
  end

  create_table "custom_medias", force: :cascade do |t|
    t.string "type"
    t.integer "general_medias_id"
    t.index ["general_medias_id"], name: "index_custom_medias_on_general_medias_id"
  end

  create_table "followers", force: :cascade do |t|
    t.string "user"
    t.string "fTarget"
  end

  create_table "general_medias", force: :cascade do |t|
    t.string "name"
  end

  create_table "history_logs", force: :cascade do |t|
    t.string "historyMessage"
    t.integer "users_id"
    t.index ["users_id"], name: "index_history_logs_on_users_id"
  end

  create_table "magazines", force: :cascade do |t|
    t.integer "issue"
    t.integer "general_medias_id"
    t.index ["general_medias_id"], name: "index_magazines_on_general_medias_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "director"
    t.integer "general_medias_id"
    t.index ["general_medias_id"], name: "index_movies_on_general_medias_id"
  end

  create_table "musics", force: :cascade do |t|
    t.string "artist"
    t.string "album"
    t.integer "general_medias_id"
    t.index ["general_medias_id"], name: "index_musics_on_general_medias_id"
  end

  create_table "personal_media_parameters", force: :cascade do |t|
    t.integer "score"
    t.string "currentStatus"
    t.boolean "favorite"
    t.text "comments"
    t.string "source"
    t.integer "replay"
    t.integer "users_id"
    t.integer "general_medias_id"
    t.index ["general_medias_id"], name: "index_personal_media_parameters_on_general_medias_id"
    t.index ["users_id"], name: "index_personal_media_parameters_on_users_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.binary "wallpaper"
    t.integer "fontSize"
    t.string "font"
    t.binary "profilePicture"
    t.boolean "privacy"
    t.string "fontColor"
    t.integer "users_id"
    t.index ["users_id"], name: "index_preferences_on_users_id"
  end

  create_table "tv_shows", force: :cascade do |t|
    t.integer "numberOfSeasons"
    t.integer "totalEpisodes"
    t.integer "general_medias_id"
    t.index ["general_medias_id"], name: "index_tv_shows_on_general_medias_id"
  end

  create_table "users", primary_key: "username", id: :string, force: :cascade do |t|
    t.integer "id", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.datetime "last_log_on"
    t.index ["username"], name: "sqlite_autoindex_users_1", unique: true
  end

  create_table "video_games", force: :cascade do |t|
    t.string "studio"
    t.string "system"
    t.integer "general_medias_id"
    t.index ["general_medias_id"], name: "index_video_games_on_general_medias_id"
  end

end
