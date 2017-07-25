FactoryGirl.define do
  factory :idea do
    sequence(:title) { |n| "#{Faker::Coffee.blend_name} #{n}" }
    body { Faker::Coffee.notes }
    end_date { Faker::Date.between(1.month.from_now, 1.day.from_now) }
  end
end
