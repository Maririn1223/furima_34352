FactoryBot.define do
  factory :item do
    association :user

    title         {'test'}
    text          {'test'}
    tag_id        {2}
    condition_id  {2}
    charge_id     {2}
    prefecture_id {2}
    order_date_id {2}
    price         {'500'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item_image.png'), filename: 'item_image.png' )
    end
  end
end
