class AuthorFavorite < ApplicationRecord
  belongs_to :user
  validates :author_name, presence: true, uniqueness: {
    scope: :user_id,
    message: "はすでにお気に入り登録されています"
  }
end