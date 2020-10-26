FactoryBot.define do
  factory :item do
    title {"テスト出品1"}
    detail {"じゅげむじゅげむごこうのすりきれ"}
    category_id {2}
    condition_id {2}
    shipping_id {2}
    pref_id {2}
    shipping_day_id {2}
    price {1000}
  end
end
