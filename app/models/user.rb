class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_many :author_favorites, dependent: :destroy
  has_many :favored_authors, through: :author_favorites, source: :author
  has_many :book_favorites, dependent: :destroy
  has_many :favorite_books, through: :book_favorites, source: :title_kana
  has_many :notices, dependent: :destroy
  has_many :notice_books, through: :notices, source: :favored_author_book
  has_many :book_notices, dependent: :destroy
  has_many :notice_favored_books, through: :book_notices, source: :favored_book

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX }
  
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :omniauthable

  after_create :send_welcome_email

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def send_welcome_email
    RegistrationMailer.welcome_email(self).deliver
  end
end