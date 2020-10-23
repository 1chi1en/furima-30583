FactoryBot.define do
  factory :user do
    nickname {"から揚げマン"}
    email {"d@gmail.com"}
    password {"aaa111"}
    password_confirmation {password}
    last_name {"亜あア"}
    first_name {"井いイ"}
    kana_last_name {"アアア"}
    kana_first_name {"イイイ"}
    birth {"1930-01-01"}
  end
end