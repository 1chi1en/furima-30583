require 'rails_helper'

RSpec.describe User, type: :model do

 describe 'ユーザー新規登録' do
  it "ユーザー情報がきちんと入力されていれば登録できる" do
  end
  it "nicknameが未入力だと登録できない" do
  end
  it "emailが未入力だと登録できない" do
    user = User.new(nickname: "あああ", 
                email: "d@gmail.com", 
                password: "aaa111", 
                password_confirmation: "aaa111",
                last_name: "あい",
                first_name: "うえお",
                kana_last_name)
  end
  it "emailは重複登録できない" do
  end
  it "emailには@が含まれていなければ登録できない" do
  end
  it "passwordが未入力だと登録できない" do
  end
  it "passwordが半角英数字混合でないと登録できない" do
  end
  it "passwordは確認用含め2回入力されていないと登録できない" do
  end
  it "確認用含め2回入力されたパスワードは値が一致しなければならない" do
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
