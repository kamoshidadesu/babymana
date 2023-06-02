FactoryBot.define do
  factory :calendar do
    start_time  { Faker::Time.between(from: DateTime.now, to: DateTime.now + 1.year) }
    end_time    { Faker::Time.between(from: start_time, to: start_time + 1.day) }
    schedule    { Faker::Lorem.sentence }

    association :user
  end
end
