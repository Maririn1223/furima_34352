class Address < ApplicationRecord
  belongs_to :order

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, presence: true, numericality: {other_than: 1}
end
