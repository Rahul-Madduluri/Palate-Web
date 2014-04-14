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

ActiveRecord::Schema.define(version: 20140414091157) do

  create_table "artists", force: true do |t|
    t.string   "name"
    t.string   "twitter_handle"
    t.string   "echonest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.string   "spotify_uri"
  end

  add_index "artists", ["echonest_id"], name: "index_artists_on_echonest_id"

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "movies", force: true do |t|
    t.string   "title"
    t.integer  "year"
    t.integer  "critics_rating"
    t.decimal  "adventurousness"
    t.decimal  "instinctiveness"
    t.decimal  "pace"
    t.decimal  "valence"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.decimal  "freshness"
    t.decimal  "official_rating"
  end

  create_table "palate_recommendations", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "media_id"
    t.string   "media_type"
  end

  add_index "palate_recommendations", ["user_id", "created_at"], name: "index_palate_recommendations_on_user_id_and_created_at"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "songs", force: true do |t|
    t.string   "title"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "echonest_id"
    t.string   "spotify_uri"
    t.decimal  "official_rating"
  end

  add_index "songs", ["echonest_id"], name: "index_songs_on_echonest_id"

  create_table "user_artists", force: true do |t|
    t.integer  "user_id"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_artists", ["artist_id"], name: "index_user_artists_on_artist_id"
  add_index "user_artists", ["user_id", "artist_id"], name: "index_user_artists_on_user_id_and_artist_id", unique: true
  add_index "user_artists", ["user_id"], name: "index_user_artists_on_user_id"

  create_table "user_movies", force: true do |t|
    t.string   "user_id"
    t.string   "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_movies", ["movie_id"], name: "index_user_movies_on_movie_id"
  add_index "user_movies", ["user_id", "movie_id"], name: "index_user_movies_on_user_id_and_movie_id", unique: true
  add_index "user_movies", ["user_id"], name: "index_user_movies_on_user_id"

  create_table "user_songs", force: true do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "personal_rating"
  end

  add_index "user_songs", ["song_id"], name: "index_user_songs_on_song_id"
  add_index "user_songs", ["user_id", "song_id"], name: "index_user_songs_on_user_id_and_song_id", unique: true
  add_index "user_songs", ["user_id"], name: "index_user_songs_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                    default: false
    t.decimal  "adventurousness_affinity"
    t.decimal  "instinctiveness_affinity"
    t.decimal  "pace_affinity"
    t.decimal  "valence_affinity"
    t.decimal  "freshness_affinity"
    t.decimal  "critics_affinity"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
