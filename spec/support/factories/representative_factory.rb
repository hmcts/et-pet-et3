FactoryBot.define do
  factory :representative, class: OpenStruct do
  end

  trait :representative_valid do
    type {:"questions.type_of_representative.solicitor.label"}
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
    have_representative {:"questions.have_representative.yes.label"}
    representative_mobile {"07987654321"}
    representative_reference {"Rep Ref"}
    representative_contact_preference {:"questions.representative_contact_preference.fax.label"}
    representative_fax {"0207 345 6789"}
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
    have_representative {:"questions.have_representative.no.label"}
    representative_mobile {"string"}
    representative_reference {""}
    representative_contact_preference {:"questions.representative_contact_preference.email.label"}
    representative_fax {"string"}
    employer_contract_claim {:"questions.employer_contract_claim.yes.label"}
  end
end
