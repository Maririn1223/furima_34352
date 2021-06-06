class Product < ApplicationRecord
  validates :title,         presence: true
  validates :text,          presence: true
  validates :tag_id,        presence: true
  validates :condition_id,  presence: true
  validates :charge_id,     presence: true
  validates :prefecture_id, presence: true
  validates :order_date_id, presence: true
  validates :price,         presence: true
end
