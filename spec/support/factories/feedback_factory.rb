require 'faker'

FactoryBot.define do
  factory :feedback, class: OpenStruct do
    problems { "No problems" }
    suggestions { "I don't have any suggestions" }
    email_address { 'test@example.com' }
  end

end
