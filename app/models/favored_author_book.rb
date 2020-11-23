class FavoredAuthorBook < ApplicationRecord
  has_many :notices, dependent: :destroy
  has_many :notice_books, through: :notices, source: :users
  
  validates :isbn, uniqueness:{message: "はすでに登録されています"}
end
