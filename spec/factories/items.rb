FactoryBot.define do
  factory :item do
    name {"商品名"}
    text {"商品説明文"}
    genre_id {"2"}
    status_id {"2"}
    charge_id {"2"}
    prefecture_id {"2"}
    day_id {"2"}
    price {"12345"}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
