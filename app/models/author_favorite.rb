class AuthorFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :author
  validates :author_id, uniqueness: {
    scope: :user_id,
    message: "はすでに登録されています"
  }

  def self.favored_by?(author, user)
    find_by(author_id: author.id, user_id: user.id).present?
  end

end