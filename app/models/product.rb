class Product < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :tags  
  belongs_to_active_hash :condition
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :order_date
  has_one                :purchase
  has_one                :delivery

  validates :title,         presence: true
  validates :text,          presence: true
  validates :tag_id,        presence: true
  validates :condition_id,  presence: true
  validates :charge_id,     presence: true
  validates :prefecture_id, presence: true
  validates :order_date_id, presence: true
  validates :price,         presence: true
end
