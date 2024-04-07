class Item < ApplicationRecord
  has_one_attached :image
  has_many :posts
  
  # 投稿画像がなかったときno_imageを表示する
  def get_image
    (image.attached) ? image : 'no_image.jpg'
  end
end
