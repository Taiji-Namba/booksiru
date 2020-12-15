class BookFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :favored_book
  validates :user_id, uniqueness: {
    scope: :favored_book_id,
    message: "は同じ系列の本に2回以上いいねはできません"
  }

  def self.favored_by?(favored_book, user)
    find_by(favored_book_id: favored_book.id, user_id: user.id).present?
  end
  
end
