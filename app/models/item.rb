class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :order_date

  validates :tag_id, numericality: { other_than: 1 }
  validates :charge_id, numericality: { other_than: 1 }
  validates :order_date_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
end

  belongs_to :user
  has_one_attached :image

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
