class Post < ApplicationRecord
  
  has_many :comments
  has_many :post_tags
  belongs_to :user
  belongs_to :item
end
