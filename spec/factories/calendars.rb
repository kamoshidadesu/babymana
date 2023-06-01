FactoryBot.define do
  factory :calendar do
    start_time  { Faker::Time.between(from: Datetime.now - 1, to: DateTime.now) }
    end_time    { Faker::Time.between(from: Datetime.now - 1, to: DateTime.now) }
    schedule    { Faker::Lorem.sentence }

    association :user
  end
end
