FactoryGirl.define do
  factory :user do
    name                Faker::Name.name
    email               { Faker::Internet.email }
    provider            'google_oauth2'
    sequence(:uid)      { |n| "1234567890#{n}" }
    password            '!@#$%^&*()'

    factory :user_with_gmd_campaigns do
      after(:create) do |user|
        create_list(:campaign, rand(0..2), gamemaster: user)
      end
    end

    factory :user_with_played_campaigns do
      after(:create) do |user|
        rand(1..5).times do
          create(:character, played_by: user)
        end
      end
    end    
  end

  factory :campaign do
    name            Faker::Company.name
    description     Faker::Lorem.paragraphs(2).join("\n\n")
    association     :gamemaster, factory: :user
    association     :power_level, factory: :power_level
  end

  factory :skill_level do
    name     'Incompetant'
    modifier -1
  end

  factory :power_level do
    name          'Out of the Tank'
    refresh       12
    skill_points  40
    association   :skill_cap, factory: :skill_level
  end

  factory :aspect do
    sequence(:name) { |n| "Complete Test Aspect #{n}" }
  end

  factory :phase do
    name      'Character Phase 1'
    question  'What is the meaning of life?'
  end

  factory :character_phase do
    character
    phase
    aspect
  end

  factory :character do
    sequence(:name) {|n| "#{Faker::Name.name}#{n}" }
    description   Faker::Lorem.paragraphs(2).join("\n\n")
    association   :played_by, factory: :user
    association   :high_concept, factory: :aspect
    association   :trouble, factory: :aspect
    campaign
  end
end