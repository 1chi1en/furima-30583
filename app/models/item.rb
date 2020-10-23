class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :detail
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :pref_id
    validates :shipping_day_id
    validates :price
  end
end
