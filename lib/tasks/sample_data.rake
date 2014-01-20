namespace :db do
  desc 'Fill database with sample data.'
  task populate: :environment do
    Rake::Task['db:reset'].invoke

    10.times do |n|
      email       = Faker::Internet.email
      provider    = 'google_oauth2'
      uid         = '1234567890' << n.to_s
      password    = '!@#$%^&*()'
      name        = Faker::Name.name
      User.create!(
        name:     name,
        email:    email,
        provider: provider,
        uid:      uid,
        password: password
      )
    end

    50.times do |n|
      name          = Faker::Company.name
      description   = Faker::Lorem.paragraphs(2).join("\n\n")
      gamemaster_id = User.offset(rand(User.count)).pluck(:id).first
      Campaign.create!(
        name:           name,
        description:    description,
        gamemaster_id:  gamemaster_id
      )
    end
  end
end