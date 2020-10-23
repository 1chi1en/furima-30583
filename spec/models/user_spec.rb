require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "ユーザー情報がきちんと入力されていれば登録できる" do
    expect(@user).to be_valid
    end
    it "nicknameが未入力だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが未入力だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailは重複登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailには@が含まれていなければ登録できない" do
      @user.email = "aaa.gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが未入力だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが半角英字のみの場合登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが半角数字のみの場合登録できない" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordは確認用含め2回入力されていないと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "確認用含め2回入力されたパスワードは値が一致しなければならない" do
      @user.password_confirmation = "bbb222"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '本人情報確認' do
    it "本名欄はlast_nameが未入力だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "本名欄はfirst_nameが未入力だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "本名欄はlast_nameが漢字、全角かな/カナで入力されていないと登録できない" do
      @user.last_name = "aa11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "本名欄はfirst_nameが漢字、全角かな/カナで入力されていないと登録できない" do
      @user.first_name = "aa11"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "本名欄のフリガナはkana_last_nameが未入力だと登録できない" do
      @user.kana_last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end
    it "本名欄のフリガナはkana_first_nameが未入力だと登録できない" do
      @user.kana_first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end
    it "本名欄のフリガナ（last_name）は全角カナで入力されないと登録できない" do
      @user.last_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "本名欄のフリガナ（first_name）は全角カナで入力されないと登録できない" do
      @user.first_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "生年月日が未入力だと登録できない" do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end

end
