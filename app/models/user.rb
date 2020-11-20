class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email, unique: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "＠を含むメールアドレスを入力してください"}
    validates :encrypted_password, format: { with: /\A[a-zA-Z0-9]+\z/, message: "半角英数混合で入力してください。"}
    validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角（漢字・ひらがな・カタカナ）で入力してください"}
    validates :last_name,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角（漢字・ひらがな・カタカナ）で入力してください"}
    validates :first_name_reading,format: { with: /\A[ァ-ヶー－]+\z/, message: "全角（カタカナ）で入力してください"}
    validates :last_name_reading,format: { with: /\A[ァ-ヶー－]+\z/, message: "全角（カタカナ）で入力してください"}
    validates :birth_day
  end
end
