FactoryBot.define do
  factory :user do
    nickname              {"karen"}
    email                 {"kkk@gmail.com"}
    password              {"kare0000"}
    password_confirmation {password}
    familyname            {"秋本"}
    firstname             {"華蓮"}
    familyname_kana       {"アキモト"}
    firstname_kana        {"カレン"} 
    birthday              {20000130}
  end
end
