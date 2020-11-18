class Author < ApplicationRecord
  has_many :author_favorites, dependent: :destroy
  validates :author_name, presence: true, uniqueness: {message: "はすでにお気に入り登録されています"}
  has_many :favored_author_books, dependent: :destroy

  def self.registered(book)
    find_or_initialize_by(author_name: book.author.delete("/ |　/"))
  end
  
end