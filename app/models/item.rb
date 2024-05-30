class Item < ApplicationRecord
  has_one_attached :image
  has_many :posts
  
  validates :name, presence: true
  validates :price, presence: true
  validates :capacity, presence: true
  
  # 投稿画像がなかったときno_imageを表示する
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
  
  def self.search(keyword)
    Item.where('name LIKE ?','%'+ keyword + '%')
  end
end
