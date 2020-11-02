#フォームオブジェクト用
class Buyinfo
  include ActiveModel::Model
    attr_accessor :token, :post_code, :town, :address, :residence_name, :phone 

    with_options presence: true do
      validates :token
      validates :post_code, format { with: /\A\d{3}[-]\d{4}\z/ } #郵便番号
      validates :town, format { with: /\A[ぁ-んァ-ン一-龥]/ } #かなカナ漢字
      validates :address,
      validates :residence_name
      validates :phone, format { with: /\A\d{10,11}\z/ } #ハイフンなし半角数字10桁ot11桁
  end

  def save
    buyers = Buyer.create(post_code: post_code, town: town, address: address, residence_name: residence_name, phone: phone)
  end
  
end

