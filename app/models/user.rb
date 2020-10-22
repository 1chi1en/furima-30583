class User < ApplicationRecord
  PASSWORD = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze #英数字混合
  NAME = /\A[ぁ-んァ-ン一-龥]/.freeze #かな全角カナ漢字
  KATAKANA = /\A[ァ-ヶー－]+\z/.freeze #全角カナ

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: NAME }
  validates :first_name, presence: true, format: { with: NAME }
  validates :kana_last_name, presence: true, format: { with: KATAKANA }
  validates :kana_first_name, presence: true, format: { with: KATAKANA }
  validates :birth, presence: true
  validates_format_of :password, with: PASSWORD

end
