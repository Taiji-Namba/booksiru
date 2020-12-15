# 発売日が近いfavored_booksのデータをユーザーに通知するためのテーブル

class BookNotice < ApplicationRecord
  belongs_to :user
  belongs_to :favored_book
  validates :user_id, uniqueness: {
    scope: :favored_book_id,
    message: "は同じ系列の本を2回以上登録できません"
  }
end