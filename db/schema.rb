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

ActiveRecord::Schema.define(version: 20160702205659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributor_episodes", force: :cascade do |t|
    t.integer "contributor_id"
    t.integer "episode_id"
  end

  add_index "contributor_episodes", ["contributor_id"], name: "index_contributor_episodes_on_contributor_id", using: :btree
  add_index "contributor_episodes", ["episode_id"], name: "index_contributor_episodes_on_episode_id", using: :btree

  create_table "contributor_shows", force: :cascade do |t|
    t.integer "contributor_id"
    t.integer "show_id"
  end

  add_index "contributor_shows", ["contributor_id"], name: "index_contributor_shows_on_contributor_id", using: :btree
  add_index "contributor_shows", ["show_id"], name: "index_contributor_shows_on_show_id", using: :btree

  create_table "contributors", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.boolean  "lead_contributor"
    t.string   "email"
    t.string   "password_digest"
    t.string   "twitter"
    t.text     "bio"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "aka"
    t.string   "key"
    t.string   "since"
  end

  create_table "episodes", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "exclusive"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.integer  "show_id"
  end

  add_index "episodes", ["show_id"], name: "index_episodes_on_show_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "episode_id"
  end

  add_index "likes", ["episode_id"], name: "index_likes_on_episode_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "shows", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "desc"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "twitter"
    t.text     "bio"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "username"
  end

  add_foreign_key "episodes", "shows"
end
