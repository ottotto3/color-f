class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      t.string  :name,          nill: false
      t.text    :introduction,  nill: false
      t.integer :price,         nill: false
      t.integer :capacity,      nill: false
      t.boolean :is_active,     nill: false, default: true

      t.timestamps
    end
  end
end
