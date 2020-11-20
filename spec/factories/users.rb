FactoryBot.define do
  factory :user do
    nickname {"yamada"}
    email {"yamada@gmail.com"}
    password {"a123456"}
    password_confirmation {"a123456"}
    first_name {"山田"}
    last_name {"太郎"}
    first_name_reading {"ヤマダ"}
    last_name_reading {"タロウ"}
    birth_day {"2020-01-01"}
  end
end