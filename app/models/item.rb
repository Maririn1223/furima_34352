class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :text
    validates :tag_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :order_date_id
    validates :price
  end
end
