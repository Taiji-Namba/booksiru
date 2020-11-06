class AuthorFavorite < ApplicationRecord
  belongs_to :user
  validates :author_name, presence: true, uniqueness: {
    scope: :user_id,
    message: "はすでにお気に入り登録されています"
  }

  def self.favored_by?(book, user)
    find_by(author_name: book.author, user_id: user.id).present?
  end

  def self.favored(book, user)
    find_by(author_name: book.author, user_id: user.id)
  end

end
