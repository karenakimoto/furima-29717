FactoryBot.define do
  factory :order_address do
    postal_code      { '111-1111' }
    prefectures_id   { 2 }
    city             { '横浜市' }
    address          {'青山1-1'}
    building         {'8-8'}
    phonenumber      {'09088888888'}
    token            {'n1n1n1n1n1n1n1n1n1n1n'}
  end
end
