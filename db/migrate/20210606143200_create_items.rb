class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,          null: false
      t.string :image,          null: false
      t.text :text,             null: false
      t.integer :tag_id,        null: false
      t.integer :condition_id,  null: false
      t.integer :charge_id,     null: false
      t.integer :prefecture_id, null: false
      t.integer :order_date_id, null: false
      t.integer :price,         null: false

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
