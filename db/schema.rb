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

ActiveRecord::Schema.define(version: 20171114151717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collaborations", force: :cascade do |t|
    t.integer "status_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "request_sender_id"
    t.integer "request_receiver_id"
  end

  create_table "connections", force: :cascade do |t|
    t.integer "champ_id"
    t.integer "squad_member_id"
    t.integer "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goal_tags", force: :cascade do |t|
    t.integer "goal_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.text "content"
    t.date "by_when"
    t.boolean "private", default: false
    t.integer "user_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_objectives", force: :cascade do |t|
    t.text "content"
    t.date "by_when"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", default: ""
    t.text "description", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "project_pic_file_name"
    t.string "project_pic_content_type"
    t.integer "project_pic_file_size"
    t.datetime "project_pic_updated_at"
  end

  create_table "request_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_goals", force: :cascade do |t|
    t.text "content"
    t.integer "goal_id"
    t.boolean "complete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "given_name", null: false
    t.string "family_name", null: false
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_pic_file_name"
    t.string "profile_pic_content_type"
    t.integer "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
    t.string "auth_hash"
  end

  create_table "visions", force: :cascade do |t|
    t.text "statement"
    t.date "timeframe"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
