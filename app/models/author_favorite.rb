class AuthorFavorite < ApplicationRecord
  belongs_to :user
  validates :author_name, presence: true
end