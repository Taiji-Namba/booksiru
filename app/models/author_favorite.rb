class AuthorFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :author
  validates :user_id, uniqueness: {
    scope: :author_id,
    message: "はすでにお気に入り登録されています"
  }

  def self.favored(user)
    find_by(author_id: params[:author_id], user_id: user.id)
  end

end