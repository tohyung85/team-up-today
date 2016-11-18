FactoryGirl.define do
  factory :user_work_sample do
    title 'sample work'
    association :profile
  end
end
