class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :order_date


  with_options numericality: { other_than: 1 } do
    validates :tag_id
    validates :charge_id
    validates :order_date_id
    validates :condition_id
    validates :prefecture_id
  end

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :image
    validates :text
    validates :tag_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :order_date_id
    validates :price, numericality: {with: /\A[0-9]+\z/, minimum: 300, maximum: 9999999 }
  end
end
