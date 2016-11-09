FactoryGirl.define do
  factory :profile do
    sequence :first_name do |n|
      "John#{n}"
    end
    last_name 'Doe'
    association :user
    factory :profile_with_interests do
      group_type_interests 'ECommerce, Blogging, Mastermind'
    end
  end
end
