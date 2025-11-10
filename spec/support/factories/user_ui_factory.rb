require 'faker'
require 'ostruct'

FactoryBot.define do
  factory :user_ui, class: OpenStruct do
    trait :valid do
      email { "test@gmail.com" }
      memorable_word { "password" }
    end
  end
end
