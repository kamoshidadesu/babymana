FactoryBot.define do
  factory :user do
    name                  { Faker::Name.name}
    nickname              { Faker::Name.name}
    email                 { Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    gender_id             { Faker::Number.between(from: 2, to:3) }
  end
end