class OrderLog
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :tell, :item_id, :user_id
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフン含めた8桁の半角数字で入力してください' }
    validates :city
    validates :house_number
    validates :tell, format: { with: /\d{10}/, message: 'ハイフン含めずに10桁の半角数字で入力してください' }
  end

  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save

    log = Log.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city, house_number: house_number, building_name: building_name, prefecture: prefecture, tell: tell, log_id: log.id)
  end
end