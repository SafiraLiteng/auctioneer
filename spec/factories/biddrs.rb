FactoryGirl.define do

  factory :biddr do
    association :item, factory: :item
    bid { [10, 100, 110, 115, 15].sample }
  end
  
end
