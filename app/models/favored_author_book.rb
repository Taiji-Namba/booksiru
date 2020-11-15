class FavoredAuthorBook < ApplicationRecord
  belongs_to :author_favorite
  has_many :register_books, dependent: :destroy
  has_many :registered_author_favorites, through: :register_books, source: :author_favorites
end
