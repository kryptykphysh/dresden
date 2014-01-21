FactoryGirl.define do
  factory :user do
    name                Faker::Name.name
    email               { Faker::Internet.email }
    provider            'google_oauth2'
    sequence(:uid)      { |n| "1234567890#{n}" }
    password            '!@#$%^&*()'
  end

  factory :campaign do
    name            Faker::Company.name
    description     Faker::Lorem.paragraphs(2).join("\n\n")
    association     :gamemaster, factory: :user
    # association     :players, factory: user
    # association     :players, factory: user
    # association     :players, factory: user
  end
end