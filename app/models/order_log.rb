class OrderLog
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :tell, :item_id, :user_id,:token
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフン含めた8桁の半角数字で入力してください' }
    validates :city
    validates :house_number
    validates :tell, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'ハイフン含めずに11桁以内の半角数字で入力してください' }
    validates :item_id
    validates :user_id
    validates :token
  end

  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }

  def save
    log = Log.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city, house_number: house_number, building_name: building_name, prefecture: prefecture, tell: tell, log_id: log.id)
  end
end