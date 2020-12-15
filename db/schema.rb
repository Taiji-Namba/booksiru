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

ActiveRecord::Schema.define(version: 2020_12_15_114524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "author_favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_author_favorites_on_author_id"
    t.index ["user_id", "author_id"], name: "index_author_favorites_on_user_id_and_author_id", unique: true
    t.index ["user_id"], name: "index_author_favorites_on_user_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "author_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "book_favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "title_kana_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title_kana_id"], name: "index_book_favorites_on_title_kana_id"
    t.index ["user_id", "title_kana_id"], name: "index_book_favorites_on_user_id_and_title_kana_id", unique: true
    t.index ["user_id"], name: "index_book_favorites_on_user_id"
  end

  create_table "book_notices", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "favored_book_id", null: false
    t.integer "notice_flag", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["favored_book_id"], name: "index_book_notices_on_favored_book_id"
    t.index ["user_id", "favored_book_id"], name: "index_book_notices_on_user_id_and_favored_book_id", unique: true
    t.index ["user_id"], name: "index_book_notices_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favored_author_books", force: :cascade do |t|
    t.string "author_name"
    t.string "isbn"
    t.string "title"
    t.string "sales_date"
    t.integer "days_to_release"
    t.string "item_url"
    t.string "item_price"
    t.string "publisher_name"
    t.string "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["isbn"], name: "index_favored_author_books_on_isbn", unique: true
  end

  create_table "favored_books", force: :cascade do |t|
    t.string "author_name"
    t.string "isbn"
    t.string "title"
    t.string "title_kana"
    t.string "sales_date"
    t.integer "days_to_release"
    t.string "item_url"
    t.string "item_price"
    t.string "publisher_name"
    t.string "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre"
    t.string "booksgenreid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notices", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "favored_author_book_id", null: false
    t.integer "notice_flag", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["favored_author_book_id"], name: "index_notices_on_favored_author_book_id"
    t.index ["user_id", "favored_author_book_id"], name: "notices_index", unique: true
    t.index ["user_id"], name: "index_notices_on_user_id"
  end

  create_table "title_kanas", force: :cascade do |t|
    t.string "title_kana", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "author_favorites", "authors"
  add_foreign_key "author_favorites", "users"
  add_foreign_key "book_favorites", "title_kanas"
  add_foreign_key "book_favorites", "users"
  add_foreign_key "book_notices", "favored_books"
  add_foreign_key "book_notices", "users"
  add_foreign_key "notices", "favored_author_books"
  add_foreign_key "notices", "users"
end
