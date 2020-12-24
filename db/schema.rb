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

ActiveRecord::Schema.define(version: 2020_12_24_153328) do

  create_table "bookcomments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "bookpost_id", null: false
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bookpost_id"], name: "index_bookcomments_on_bookpost_id"
    t.index ["user_id"], name: "index_bookcomments_on_user_id"
  end

  create_table "booklikes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "bookpost_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bookpost_id"], name: "index_booklikes_on_bookpost_id"
    t.index ["user_id", "bookpost_id"], name: "index_booklikes_on_user_id_and_bookpost_id", unique: true
    t.index ["user_id"], name: "index_booklikes_on_user_id"
  end

  create_table "bookposts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "bookimage"
    t.index ["user_id"], name: "index_bookposts_on_user_id"
  end

  create_table "commentlikes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "bookcomment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bookcomment_id"], name: "index_commentlikes_on_bookcomment_id"
    t.index ["user_id", "bookcomment_id"], name: "index_commentlikes_on_user_id_and_bookcomment_id", unique: true
    t.index ["user_id"], name: "index_commentlikes_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "avatar"
  end

  add_foreign_key "bookcomments", "bookposts"
  add_foreign_key "bookcomments", "users"
  add_foreign_key "booklikes", "bookposts"
  add_foreign_key "booklikes", "users"
  add_foreign_key "bookposts", "users"
  add_foreign_key "commentlikes", "bookcomments"
  add_foreign_key "commentlikes", "users"
end
