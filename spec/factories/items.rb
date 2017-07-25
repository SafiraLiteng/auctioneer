FactoryGirl.define do
  
  factory :item do
  
    sequence(:title) {|n| Faker::Commerce.product_name + "#{n}"}
    body Faker::Hacker.say_something_smart
    current_price 1
  end

end
