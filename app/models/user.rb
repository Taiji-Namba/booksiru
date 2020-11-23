class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_many :author_favorites, dependent: :destroy
  has_many :favored_authors, through: :author_favorites, source: :author
  has_many :register_books, dependent: :destroy
  has_many :registered_books, through: :register_books, source: :favored_author_book

  # has_many :notices, dependent: :destroy
  # has_many :noticing_book, through: :notices, source: :register_book

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :nickname, presence: true 
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX }
  
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "ゲストさん"
    end
  end
end