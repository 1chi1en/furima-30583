class Buyer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :pref

  belongs_to :purchase
end
