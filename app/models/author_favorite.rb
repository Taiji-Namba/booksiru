class AuthorFavorite < ApplicationRecord
  belongs_to :user
  validates :author_name, presence: true, uniqueness: {
    scope: :user_id,
    message: "はすでにお気に入り登録されています"
  }

has_many :favored_author_books, dependent: :destroy

  def self.favored(book, user)
    find_by(author_name: book.author.gsub(" ","").gsub("　",""), user_id: user.id)
  end

end