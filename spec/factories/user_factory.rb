FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    password { 'password' }
    password_digest { User.digest('password') }
    email { Faker::Internet.email }
    activated { true }
    admin { true }
  end
end