class Author < ApplicationRecord
  has_many :author_favorites, dependent: :destroy
  validates :author_name, presence: true
  accepts_nested_attributes_for :author_favorites
end
