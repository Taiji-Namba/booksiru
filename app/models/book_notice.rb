class BookNotice < ApplicationRecord
  belongs_to :user
  belongs_to :favored_book
end
