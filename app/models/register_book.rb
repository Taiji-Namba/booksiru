class RegisterBook < ApplicationRecord
  belongs_to :author_favorite
  belongs_to :favored_author_book
end
