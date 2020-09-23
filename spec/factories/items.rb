FactoryBot.define do
  factory :item do
    association :user
    name              { '漫画' }
    details           { '鋼の錬金術師の全巻です' }
    category_id       { 6 }
    condition_id      { 3 }
    deliveryfee_id    { 2 }
    prefectures_id    { 28 }
    days_id           { 2 }
    price             { 10000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename:'test_image.png')
    end
  end
end
