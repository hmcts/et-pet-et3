FactoryBot.define do
  factory :additional_information do
    initialize_with { new(attributes) }

    trait :with_upload_additional_information do
      upload_additional_information do
        {
          'filename' => 'sample.rtf',
          'path' => '/tmp/sample.rtf',
          'content_type' => 'application/rtf'
        }
      end
    end
  end
end
