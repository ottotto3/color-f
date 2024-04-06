class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer :user_id,      nill: false
      t.integer :item_id,      nill: false
      t.string  :color,        nill: false
      t.float   :star,         nill: false
      t.text    :introduction, nill: false

      t.timestamps
    end
  end
end
