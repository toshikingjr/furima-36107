FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.first_name_neutral}
    email                   {Faker::Internet.free_email}
    password                {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation   {password}
    first_name              {Gimei.first.hiragana}
    last_name               {Gimei.last.kanji}
    furigana_first_name     {Gimei.first.katakana}
    furigana_last_name      {Gimei.last.katakana}
    birth_date              {Faker::Date.between(from: '1980-09-23', to: '2020-09-25')}
  end
end

