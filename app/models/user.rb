class User < ApplicationRecord
  PASSWORD = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze #英数字混合
  NAME = /\A[ぁ-んァ-ン一-龥]/.freeze #かな全角カナ漢字
  KATAKANA = /\A[ァ-ヶー－]+\z/.freeze #全角カナ

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do

    validates :nickname
    validates :birth
    validates :password, format: { with: PASSWORD }

    with_options format: { with: NAME } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: KATAKANA } do
      validates :kana_last_name
      validates :kana_first_name
    end
  end

  has_many :items
  has_many :purchases
end
