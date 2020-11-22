class Notice < ApplicationRecord
  belongs_to :user
  belongs_to :register_book
  validates :noticed_flag, presence: true
  validates :user_id, uniqueness: {
    scope: :register_book_id,
    message: "は通知登録されています"
  }
end
