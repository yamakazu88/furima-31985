FactoryBot.define do
  factory :order_log do
    postal_code {'123-4567'}
    prefecture {2}
    city {'名古屋市'}
    house_number {'1-1'}
    building_name {'名古屋ハイツ'}
    tell {'09012345678'}
  end
end
