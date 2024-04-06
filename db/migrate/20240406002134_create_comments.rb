class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      
      t.integer :user_id, nill: false
      t.integer :post_id, nill: false
      t.text    :comment, nill: false

      t.timestamps
    end
  end
end
