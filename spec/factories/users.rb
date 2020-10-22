FactoryBot.define do
  factory :user do
    nickname {"から揚げマン"}
    email {"d@gmail.com"}
    password {"aaa111"}
    password_confirmation {password}
    last_name {"あい"}
    first_name {"うえお"}
    kana_last_name {"アイ"}
    kana_first_name {"ウエオ"}
    birth {"1930-01-01"}
  end
end