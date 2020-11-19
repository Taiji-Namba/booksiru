class FavoredAuthorBook < ApplicationRecord
  has_many :register_books, dependent: :destroy
  has_many :registered_books, through: :register_books, source: :author_favorites
  
  validates :isbn, uniqueness:{message: "はすでに登録されています"}
end
