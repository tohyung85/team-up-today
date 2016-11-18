FactoryGirl.define do
  factory :profile do
    sequence :first_name do |n|
      "John#{n}"
    end
    last_name 'Doe'
    website 'http://www.nogo.com'
    association :user
    factory :profile_with_interests do
      group_type_interests 'ECommerce, Blogging, Mastermind'
    end
  end
end
