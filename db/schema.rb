ActiveRecord::Schema.define(version: 2021_04_05_134537) do

  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.text "image", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "avatar"
  end

  add_foreign_key "pictures", "users"
end
