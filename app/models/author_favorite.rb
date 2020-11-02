class AuthorFavorite < ApplicationRecord
  belongs_to :user
  validates :author_name, presence: true

  def created?
    current_user.id.present?
  end
end