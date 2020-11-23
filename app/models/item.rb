class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_one    :log

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

  with_options numericality: { other_than: 1 } do
    validates :genre_id
    validates :status_id
    validates :charge_id
    validates :prefecture_id
    validates :day_id
  end

end
