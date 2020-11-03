class AuthorFavorite < ApplicationRecord
  belongs_to :user
  validates :author_name, presence: true

  # def created_by?(user)
  #   # find_by(user_id: user.id).present?

  # end
end