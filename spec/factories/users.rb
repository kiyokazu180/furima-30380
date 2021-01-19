FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname                 { Faker::Name.name }
    email                    { Faker::Internet.free_email }
    password                 { "hoge12" }
    password_confirmation    { "hoge12" }
    name_lc                  {person.last.kanji}
    name_gc                  {person.first.kanji}
    name_l                   {person.last.katakana}
    name_g                   {person.first.katakana}
    birth                    {Faker::Date.backward}
  end
end    