class RegisterBook < ApplicationRecord
  belongs_to :author_favorite
  belongs_to :favored_author_book
  validates :author_favorite_id, uniqueness: {
    scope: :favored_author_books_id
    message: "はすでに登録されています"
  }
end
