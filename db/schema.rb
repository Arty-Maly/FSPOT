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

ActiveRecord::Schema.define(version: 20150504233217) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "upload_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "upload_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.integer  "comments_id"
    t.integer  "likes_id"
    t.integer  "relationships_id"
    t.integer  "uploads_id"
    t.integer  "user_id"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "friends_id"
  end

  add_index "notifications", ["comments_id"], name: "index_notifications_on_comments_id"
  add_index "notifications", ["likes_id"], name: "index_notifications_on_likes_id"
  add_index "notifications", ["relationships_id"], name: "index_notifications_on_relationships_id"
  add_index "notifications", ["uploads_id"], name: "index_notifications_on_uploads_id"
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "restaurants", force: true do |t|
    t.string   "restaurant_name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "geo_loaction"
    t.string   "rating_img"
    t.string   "phone"
    t.string   "yelp_url"
  end

  create_table "uploads", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.integer  "rating"
    t.integer  "restaurant_id"
    t.string   "geo_location"
  end

  add_index "uploads", ["restaurant_id"], name: "index_uploads_on_restaurant_id"
  add_index "uploads", ["user_id"], name: "index_uploads_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
