FactoryBot.define do
  factory :management do
    start_time  {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    record_id   {Faker::Number.between(from: 2, to: 11) }

    association :user
  end
end