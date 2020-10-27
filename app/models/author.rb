class Author < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favored_users, through: :favorites, source: :user
end
