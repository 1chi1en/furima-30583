FactoryBot.define do
  factory :buyinfo do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {"890-1234"}
    pref_id {10}
    town {"座頭市"}
    address {"どこかの番地"}
    residence_name {"から揚げ王国"}
    phone {"09012345678"}
  end
end
