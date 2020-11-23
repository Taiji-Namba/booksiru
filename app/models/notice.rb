class Notice < ApplicationRecord
  belongs_to :user
  belongs_to :favored_author_book
  validates :favored_author_book_id, uniqueness: {
    scope: :user_id,
    message: "はすでに登録されています"
  }
end