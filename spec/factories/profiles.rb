FactoryGirl.define do
  factory :profile do
    sequence :first_name do |n|
      "John#{n}"
    end
    last_name 'Doe'
    association :user
  end
end
