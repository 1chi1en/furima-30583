class Purchase < ApplicationRecord
  attr_accessor :token
  
  has_one :buyer
  belongs_to :item
  belongs_to :user
end
