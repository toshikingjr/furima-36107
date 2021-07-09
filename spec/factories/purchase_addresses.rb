FactoryBot.define do
  factory :purchase_address do
    postal_code {"111-1111"}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city  {Gimei.city.kanji}
    address   {Faker::Address.street_address}
    building  {Faker::Address.secondary_address}
    phone_number {Faker::Number.leading_zero_number(digits: 10)}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
