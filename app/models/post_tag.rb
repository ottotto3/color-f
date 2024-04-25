class PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :tag
  
  def self.search(keyword)
    Tag.where('name LIKE ?','%'+ keyword + '%')
  end
end
