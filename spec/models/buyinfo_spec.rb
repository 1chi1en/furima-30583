require 'rails_helper'

RSpec.describe Buyinfo, type: :model do
  before do
    @buyinfo = FactoryBot.build(:buyinfo)
  end
  describe '商品購入' do
    it "全ての必須情報がきちんと入力されていれば購入できる(建物名は未入力でも良い)" do
      expect(@buyinfo).to be_valid
    end
  end 

  describe '商品購入-クレジット決済' do
    it "tokenが空では保存できない" do
      @buyinfo.token = nil
      @buyinfo.valid?
      expect(@buyinfo.errors.full_messages).to include("Token can't be blank")
    end
  end 

  describe '商品購入-配送先入力' do
    it "post_code（郵便番号）が未入力だと購入できない" do
      @buyinfo.post_code = ""
      @buyinfo.valid?
      expect(@buyinfo.errors.full_messages).to include("Post code can't be blank")
    end
    it "post_code（郵便番号）に半角数字以外があるとNG" do
      @buyinfo.post_code = "あ亜アA"
      @buyinfo.valid?
      expect(@buyinfo.errors.full_messages).to include("Post code is invalid")
    end
    it "pref_id(配送先地域)を選択しなければ購入できない（id:1が選ばれているとNG）" do
      @buyinfo.pref_id = 1
      @buyinfo.valid?
      expect(@buyinfo.errors.full_messages).to include("Pref must be other than 1")
    end
    it "town（市町区村）が未入力だと購入できない" do
      @buyinfo.town = ""
      @buyinfo.valid?
      expect(@buyinfo.errors.full_messages).to include("Town can't be blank")
    end
    it "town（市町区村）にアルファベットが入力されているとNG" do
      @buyinfo.town = "AAA"
      @buyinfo.valid?
      expect(@buyinfo.errors.full_messages).to include("Town is invalid")
    end
    it "town（市町区村）に数字が入力されているとNG" do
      @buyinfo.town = "1234"
      @buyinfo.valid?
      expect(@buyinfo.errors.full_messages).to include("Town is invalid")
    end
    it "address（番地）が未入力だと購入できない" do
      @buyinfo.address = ""
      @buyinfo.valid?
      expect(@buyinfo.errors.full_messages).to include("Address can't be blank")
    end
    it "phone（電話番号）が未入力だと購入できない" do
      @buyinfo.phone = ""
      @buyinfo.valid?
      expect(@buyinfo.errors.full_messages).to include("Phone can't be blank")
    end
    it "phone（電話番号）に数字以外の文字が入っているとNG" do
      @buyinfo.phone = "AAAA"
      @buyinfo.valid?
      expect(@buyinfo.errors.full_messages).to include("Phone is invalid")
    end
  end
end