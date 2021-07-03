FactoryBot.define do
  factory :order_address do
    user_id        {2}
    item_id        {2}
    postal_code    {'123-4567'}
    prefecture_id  {3}
    city           {'名古屋'}
    address        {1-1-1}
    building       {'ダイワハウス'}
    phone_number   {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
