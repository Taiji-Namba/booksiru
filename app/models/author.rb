class Author < ApplicationRecord
  has_many :author_favorites, dependent: :destroy
  has_many :favored_users, through: :author_favorites, source: :user
  validates :author_name, presence: true, uniqueness: {message: "はすでにお気に入り登録されています"}

  def self.registered(book)
    find_or_initialize_by(author_name: book.author.delete("/ |　/"))
  end

  def self.registered_2(book)
    find_or_initialize_by(author_name: book.author_name)
  end
  
end