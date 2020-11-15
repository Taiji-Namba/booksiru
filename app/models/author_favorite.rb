class AuthorFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :author
  validates :author_id, uniqueness: {
    scope: :user_id,
    message: "はすでに登録されています"
  }
  has_many :register_books, dependent: :destroy
  has_many :registered_books, through: :register_books, source: :favored_author_book

  def self.favored_by?(author, user)
    find_by(author_id: author.id, user_id: user.id).present?
  end

end