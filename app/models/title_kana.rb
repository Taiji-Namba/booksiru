class TitleKana < ApplicationRecord
  has_many :book_favorites, dependent: :destroy
  has_many :favored_user, through: :book_favorites, source: :user
  validates :title_kana, presence: true, uniqueness: {message: "はすでにお気に入り登録されています"}

  def self.registered(book)
    find_or_initialize_by(title_kana: book.title_kana)
  end

end