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

ActiveRecord::Schema.define(version: 2020_11_14_070209) do

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

  create_table "books", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favored_author_books", force: :cascade do |t|
    t.string "author_name"
    t.string "isbn"
    t.string "title"
    t.string "sales_date"
    t.string "image_url"
    t.string "item_url"
    t.string "item_price"
    t.string "books_genre_id"
    t.string "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["isbn"], name: "index_favored_author_books_on_isbn", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre"
    t.string "booksgenreid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "register_books", force: :cascade do |t|
    t.bigint "author_favorite_id", null: false
    t.bigint "favored_author_book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_favorite_id", "favored_author_book_id"], name: "register_books_index", unique: true
    t.index ["author_favorite_id"], name: "index_register_books_on_author_favorite_id"
    t.index ["favored_author_book_id"], name: "index_register_books_on_favored_author_book_id"
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
  add_foreign_key "register_books", "author_favorites"
  add_foreign_key "register_books", "favored_author_books"
end
