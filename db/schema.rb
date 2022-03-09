# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_09_182545) do

  create_table "comments", force: :cascade do |t|
    t.integer "commenter_id"
    t.integer "offering_id"
    t.text "body"
    t.boolean "private"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages_to_administrators", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "offerings", force: :cascade do |t|
    t.string "title"
    t.float "min_age"
    t.text "description"
    t.string "image"
    t.string "address"
    t.string "video"
    t.integer "giver_id"
    t.float "max_age"
    t.float "price"
    t.date "date"
    t.time "time"
    t.integer "comments_count"
    t.integer "labeled_offerings_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "profile_picture"
    t.string "first_name"
    t.string "last_name"
    t.text "about_me"
    t.integer "phone"
    t.string "address"
    t.float "kids1_age"
    t.float "kids2_age"
    t.float "kids3_age"
    t.float "kids4_age"
    t.float "kids5_age"
    t.float "kids6_age"
    t.boolean "private"
    t.integer "offerings_count"
    t.integer "comments_count"
    t.integer "messages_to_administrators_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
