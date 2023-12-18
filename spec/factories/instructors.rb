FactoryBot.define do
  factory :instructor do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
  end
end