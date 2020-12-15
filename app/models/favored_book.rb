# favored_booksテーブルはtitle_kanaで一意性制約される
# 同じtitle_kanaを持つ本が発売されるとき、ユーザーにその本の内容を通知するためのテーブル
# 例えばワンピースだと、ワンピース 96巻とワンピース97巻は同じ"ワンピース"というtitle_kanaで表されるため、favored_booksに登録することはシリーズを登録することになる

class FavoredBook < ApplicationRecord
  has_many :book_favorites, dependent: :destroy
  has_many :favorite_books, through: :book_favorites, source: :user
  validates :title_kana, presence: true, uniqueness: {message: "はすでにお気に入り登録されています"}
end