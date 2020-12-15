class BookFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :favored_book
  validates :user_id, uniqueness: {
    scope: :favored_book_id,
    message: "は同じ系列の本に2回以上いいねはできません"
  }
end
