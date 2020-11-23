class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  with_options presence: true do
    validates :nickname
    validates :birth_day

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
    validates :password, format: { with: PASSWORD_REGEX, message: "半角英数混合で入力してください"}

    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
    with_options format: { with: NAME_REGEX, message: "全角（漢字・ひらがな・カタカナ）で入力してください"} do
      validates :first_name
      validates :last_name
    end

    NAME_READING_REGEX = /\A[ァ-ヶー－]+\z/
    with_options format: { with: NAME_READING_REGEX, message: "全角（カタカナ）で入力してください"} do
      validates :first_name_reading
      validates :last_name_reading
    end
  end
end