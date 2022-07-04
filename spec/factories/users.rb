FactoryBot.define do

  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.free_email}
    password              {"a1234567"}
    encrypted_password    {"a1234567"}
    family_name           {"てすと"}
    family_name_kana      {"テスト"}
    first_name            {"てすと"}
    first_name_kana       {"テスト"}
    birth_day             {"2000-01-01"}
  end
end
