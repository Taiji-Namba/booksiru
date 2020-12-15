class TitleKana < ApplicationRecord
  has_many :book_favorites, dependent: :destroy
  has_many :favored_user, through: :book_favorites, source: :user
  validates :title_kana, presence: true, uniqueness: {message: "はすでにお気に入り登録されています"}
end