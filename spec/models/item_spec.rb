require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '商品出品機能確認' do
    it "出品情報がきちんと入力されていれば登録できる" do
      #expect(@item).to be_valid
      #end
    end
    it "商品画像は1枚付けなければ出品できない" do
    end
    it "商品名が空だと出品できない" do
    end
    it "商品説明欄が空だと出品できない" do
    end
    it "カテゴリーを選択しなければ出品できない" do
    end
    it "商品の状態を選択しなければ出品できない" do
    end
    it "配送料負担を選択しなければ出品できない" do
    end
    it "発送元地域を選択しなければ出品できない" do
    end
    it "発送までの日数を選択しなければ出品できない" do
    end
    it "販売価格が300円以下だと出品できない" do
    end
    it "販売価格が9999999円以上だと出品できない" do
    end

end
