class Author < ApplicationRecord
  has_many :author_favorites, dependent: :destroy
  validates :author_name, presence: true
  accepts_nested_attributes_for :author_favorites

  def self.registered(book)
    find_by(author_name: book.author.gsub(" ","").gsub("　",""))
  end
  
end