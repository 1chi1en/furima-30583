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
    validates :category_id, inclusion: { in: 2..11 }
    validates :condition_id, inclusion: { in: 2..7 }
    validates :shipping_id, inclusion: { in: 2..3 }
    validates :pref_id, inclusion: { in: 2..48 }
    validates :shipping_day_id, inclusion: { in: 2..4 }
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
    end

  has_one_attached :image
  belongs_to :user
  has_one :purchase

end
