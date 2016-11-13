FactoryGirl.define do
  factory :language do
    name 'English'
    association :profile
  end
end
