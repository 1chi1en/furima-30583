class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :pref
    belongs_to_active_hash :shipping
    belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image
    validates :title
    validates :detail
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :pref_id
    validates :shipping_day_id
    validates :price, numericality: { only_integer: true,greater_than: 9999999, less_than: 300 }
    end

  has_one_attached :image

end
