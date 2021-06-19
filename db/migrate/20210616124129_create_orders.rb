class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      #カード番号
      t.text :number,          null: false
      t.date :expiration_date, null: false
      t.integer :cvc,          null: false

      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
