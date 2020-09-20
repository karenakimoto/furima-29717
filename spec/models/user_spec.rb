require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "全ての記入欄に正式な値があれば登録できる"do
      expect(@user).to be_valid
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない"do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email) 
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに@が含まれないと登録できない"do
      @user.email = "karengmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下だと登録できないこと"do
      @user.password = "00000"
      @user.password_confirmation ="00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角英数字混合でない場合登録できない"do
      @user.password = "aaaaaa"
      @user.password_confirmation ="aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "familynameが空だと登録できない"do
      @user.familyname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname can't be blank")
    end

    it "firstnameが空だと登録できない"do
      @user.firstname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it "familynameが半角だと登録できない"do
      @user.familyname ="hhhh"
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname is invalid")
    end

    it "firstnameが半角だと登録できない"do
      @user.firstname ="hhhh"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname is invalid")
    end

    it "familyname_kanaが空だと登録できない"do
      @user.familyname_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname kana can't be blank", "Familyname kana is invalid")
    end

    it "firstname_kanaが空だと登録できない"do
      @user.firstname_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana can't be blank", "Firstname kana is invalid")
    end

    it "familyname_kanaが全角(カタカナ)以外の場合登録できない"do
      @user.familyname_kana = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname kana is invalid")
    end

    it "firstname_kanaが全角(カタカナ)以外の場合登録できない"do
      @user.firstname_kana = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana is invalid")
    end

    it "birthdayが空だと登録できない"do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
