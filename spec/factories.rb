FactoryGirl.define do
  factory :user do
    name      Faker::Name.name
    email     Faker::Internet.email
    provider  'google_oauth2'
    uid       '1234567890'
    password  '1234567890'
  end
end