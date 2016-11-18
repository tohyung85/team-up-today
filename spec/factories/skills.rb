FactoryGirl.define do
  factory :skill do
    name 'Ruby on Rails'
    association :profile
  end
end
