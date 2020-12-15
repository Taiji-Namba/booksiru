class FavoredBook < ApplicationRecord
  has_many :book_favorites, dependent: :destroy
  has_many :favorite_books, through: :book_favorites, source: :user
  validates :title_kana, presence: true, uniqueness: {message: "はすでにお気に入り登録されています"}
  has_many :book_notices, dependent: :destroy
  has_many :notice_favored_books, through: :book_notices, source: :user
end