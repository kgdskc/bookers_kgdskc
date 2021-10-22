class Book < ApplicationRecord
  belongs_to :user
  # ↓バリデーション
  validates :title, presence: true
  validates :synopsis, presence: true, length: { maximum: 500 }
  validates :impression, presence: true, length: { maximum: 500 }

  # ↓検索
  def self.search(keyword)
    where(["title like? OR synopsis like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
