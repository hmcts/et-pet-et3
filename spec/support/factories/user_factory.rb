require 'faker'

FactoryBot.define do
  factory :user do
    email {'test@gmail.com'}
  end
end
