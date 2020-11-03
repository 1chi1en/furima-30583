#フォームオブジェクト
class Buyinfo
  include ActiveModel::Model
    attr_accessor :token, :post_code, :pref_id, :town, :address, :residence_name, :phone, :item_id, :user_id

    POST = /\A\d{3}[-]\d{4}\z/.freeze #郵便番号
    KANA = /\A[ぁ-んァ-ン一-龥]/.freeze #かなカナ漢字
    PHONE = /\A\d{10,11}\z/.freeze #ハイフンなし半角数字10桁ot11桁

    with_options presence: true do
      #validates :token
      validates :post_code, format: { with: POST }
      validates :town, format: { with: KANA }
      validates :address
      validates :phone, format: { with: PHONE }
    end

  def save
    purchases = Purchase.create(
      item_id: item_id, 
      user_id: user_id
    )
    buyers = Buyer.create(
      post_code: post_code, 
      pref_id: pref_id, 
      town: town, 
      address: address, 
      residence_name: residence_name, 
      phone: phone, 
      purchase_id: purchases.id
    )
  end

end


