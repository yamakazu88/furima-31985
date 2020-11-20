require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに@が含まれていないと登録できない" do
        @user.email = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another = FactoryBot.build(:user)
        another.email = @user.email
        another.valid?
        expect(another.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角数字のみの場合登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数混合で入力してください")
      end

      it "passwordが半角英字のみの場合登録できない" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数混合で入力してください")
      end

      it "passwordが全角英数字の場合登録できない" do
        @user.password = "ａ１２３４５"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数混合で入力してください")
      end


      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_nameが空だと登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.first_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ）で入力してください")
      end

      it "last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.last_name = "bbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角（漢字・ひらがな・カタカナ）で入力してください")
      end

      it "first_name_readingが空だと登録できない" do
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end

      it "last_name_readingが空だと登録できない" do
        @user.last_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end

      it "first_name_readingが全角（カタカナ）でないと登録できない" do
        @user.first_name_reading = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading 全角（カタカナ）で入力してください")
      end

      it "last_nameが全角（カタカナ）でないと登録できない" do
        @user.last_name_reading = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading 全角（カタカナ）で入力してください")
      end

      it "birth_dayが空だと登録できない" do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end