FactoryBot.define do
  factory :diary do
    start_time  { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    happy       { Faker::Lorem.sentence }
  end
end
