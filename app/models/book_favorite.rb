class BookFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :title_kana
  validates :user_id, uniqueness: {
    scope: :title_kana_id,
    message: "は同じ系列の本に2回以上いいねはできません"
  }

  def self.favored_by?(title_kana, user)
    find_by(title_kana_id: title_kana.id, user_id: user.id).present?
  end
  
end
