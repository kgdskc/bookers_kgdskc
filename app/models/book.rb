class Book < ApplicationRecord
  belongs_to :user
  
  #↓検索
  def self.search(keyword)
    where(["title like? OR synopsis like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
