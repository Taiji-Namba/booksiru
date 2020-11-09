class Author < ApplicationRecord
  has_many :author_favorites, dependent: :destroy
  validates :author_name, presence: true
end
