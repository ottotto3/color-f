class Post < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :star,presence:true
  validates :introduction,presence:true,length:{maximum:400}
  
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :star_count, -> {order(star: :desc)}

  def self.tag_search(keyword)
    Post.joins(:tags).where('tags.tag_name LIKE ?','%'+ keyword + '%')
  end

  def save_tags(savepost_tags)
    # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - savepost_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = savepost_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name:old_name)
    end

    # 新しいタグを保存
    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << post_tag
    end
  end
end
