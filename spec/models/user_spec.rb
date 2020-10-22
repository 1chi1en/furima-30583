require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "ユーザー情報がきちんと入力されていれば登録できる" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
    end
    it "nicknameが未入力だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが未入力だと登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailは重複登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailには@が含まれていなければ登録できない" do
      user = FactoryBot.build(:user)
      user.email = "aaa.gmail.com"
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが未入力だと登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが半角英数字混合でないと登録できない" do
      user = FactoryBot.build(:user)
      user.password = "aaaaaa"
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordは確認用含め2回入力されていないと登録できない" do
      user = FactoryBot.build(:user)
      user.password_confirmation = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "確認用含め2回入力されたパスワードは値が一致しなければならない" do
      user = FactoryBot.build(:user)
      user.password_confirmation = "bbb222"
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '本人情報確認' do
    it "本名欄は名字と名前が未入力だと登録できない" do
    end
    it "本名欄は漢字、全角かな/カナで入力されていないと登録できない" do
    end
    it "本名欄のフリガナは名字と名前が未入力だと登録できない" do
    end
    it "本名欄のフリガナは全角カナでの入力でないと登録できない" do
    end
    it "生年月日が未入力だと登録できない" do
    end
  end

end
