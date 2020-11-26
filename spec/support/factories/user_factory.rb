require 'faker'

FactoryBot.define do
  factory :user do
    email { 'test@gmail.com' }
    password { 'password' }
  end
end
