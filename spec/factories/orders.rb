FactoryBot.define do
  factory :order do
    code         { '123-4567' }
    area_id      { 2 }
    municipality { '横浜市' }
    address      { 111 }
    building     { '東京ハイツ' }
    telephone    { '19012345678' }
    token        {"tok_abcdefghijk00000000000000000"}
  end
end
