class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_many :favorites, dependent: :destroy
  has_many :favored_authors, through: :favorites, source: :author
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
