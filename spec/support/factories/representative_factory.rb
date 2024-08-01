FactoryBot.define do
  factory :representative, class: OpenStruct do
  end

  trait :representative_valid do
    type {:"questions.your_representatives_details.type_of_representative.options.solicitor"}
    organisation_name { Faker::Company.bs }
    name { Faker::Name.name }
    building {"106"}
    street {"Mayfair"}
    locality {"London"}
    county {"Greater London"}
    post_code {"SW1H 9PP"}
    telephone_number {"01111 123456"}
    alternative_telephone_number {"02222 654321"}
    email_address  {"sivvoy.taing@hmcts.net"}
    dx_number  {"dx1234567890"}
    have_representative {:"questions.your_representatives.have_representative.options.yes"}
    representative_mobile {"07987654321"}
    representative_reference {"Rep Ref"}
    representative_contact_preference {:"questions.your_representatives_details.representative_contact_preference.options.email"}
    representative_email { "contact@solicitorsrus.com" }
    allow_phone_or_video_attendance { [:video] }
  end

  trait :representative_invalid do
    type {nil}
    organisation_name {"J4ne D0e"}
    name {'J4ne D0e'}
    building {nil}
    street {nil}
    locality {nil}
    county {nil}
    post_code {"string"}
    telephone_number {"string"}
    alternative_telephone_number {"string"}
    email_address  {"Email"}
    dx_number {"724060 Derby 21 (no validation)"}
    have_representative {:"questions.your_representatives.have_representative.options.no"}
    representative_mobile {"string"}
    representative_reference {""}
    representative_contact_preference {:"questions.your_representatives_details.representative_contact_preference.options.email"}
    employer_contract_claim {:"questions.employer_contract_claim.yes.label"}
    allow_phone_or_video_attendance { [] }
  end
end
