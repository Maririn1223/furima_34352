class OrderAddress
  include ActiveModel: :Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :number, :user_id

  with_options presence: true do
    validates :number
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Includes hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 1}

  def save
    order = Order.create(user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, order_id: order.id)
  end

end