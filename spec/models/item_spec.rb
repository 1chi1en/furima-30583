require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '商品出品機能確認' do
    it "出品情報がきちんと入力されていれば出品できる" do
      expect(@item).to be_valid
    end
    it "商品画像は1枚付けなければ出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が空だと出品できない" do
      @item.title = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it "商品説明欄が空だと出品できない" do
      @item.detail = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end
    it "カテゴリーを選択しなければ出品できない（id:1が選ばれているとNG）" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not included in the list")
    end
    it "商品の状態を選択しなければ出品できない（id:1が選ばれているとNG）" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition is not included in the list")
    end
    it "配送料負担を選択しなければ出品できない（id:1が選ばれているとNG）" do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping is not included in the list")
    end
    it "発送元地域を選択しなければ出品できない（id:1が選ばれているとNG）" do
      @item.pref_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Pref is not included in the list")
    end
    it "発送までの日数を選択しなければ出品できない（id:1が選ばれているとNG）" do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day is not included in the list")
    end
    it "販売価格が空だと出品できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "販売価格が全角数字だと出品できない" do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "販売価格が300円以下だと出品できない" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end
    it "販売価格が9999999円以上だと出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end
  end
end
