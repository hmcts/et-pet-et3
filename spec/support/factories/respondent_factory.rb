require 'faker'

FactoryBot.define do
  factory :respondent, class: OpenStruct do
      case_number {"1454321/2017"}
      name { Faker::Company.name }
      building_name {"the-shard"}
      street_name { Faker::Address.street_name }
      town {"westminster"}
      county {"london"}
      postcode {"wc1 1aa"}
      organisation_more_than_one_site {:"questions.organisation_more_than_one_site.no.label"}
  end

  trait :respondent_valid do
    contact { Faker::Name.name }
    county {"london"}
    dx_number {"234242342"}
    contact_number {"02081234567"}
    contact_mobile_number {"07123456789"}
    contact_preference {:"questions.contact_preference.email.label"}
    email_address {"sivvoy.taing@hmcts.net"}
    organisation_employ_gb {"100"}
    make_employer_contract_claim {:"questions.make_employer_contract_claim.yes.label"}
    claim_information {"lorem ipsum info"}
    email_receipt {"sivvoy.taing@hmcts.net"}
    disability {:"questions.disability.yes.label"}
    disability_information {"Lorem ipsum disability"}
  end

  trait :upload_additional_information do
    rtf_file {"sample.rtf"}
  end

  trait :respondent_invalid do
    contact {"J0hn Sm1th"}
    county {nil}
    dx_number {"724060 Derby 21 (no validation)"}
    contact_number {"string"}
    contact_mobile_number {"string"}
    contact_preference {:"questions.contact_preference.fax.label"}
    fax_number {"string"}
    employment_at_site_number {"string"}
    organisation_employ_gb {"string"}
    make_employer_contract_claim {:"questions.make_employer_contract_claim.yes.label"}
    claim_information {Faker::Lorem.characters(4501)}
    email_receipt {""}
    disability {:"questions.disability.yes.label"}
    disability_information { Faker::Lorem.characters(351) }
  end
end