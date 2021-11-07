FactoryBot.define do
  factory :notification do
    user
    text { Faker::Quote.famous_last_words }
  end
end