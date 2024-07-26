require 'faker'

FactoryBot.define do
  factory :respondent, class: OpenStruct do
      email {"test@gmail.com"}
      memorable_word {"password"}
      case_number {"1454321/2017"}
      name { Faker::Company.name }
      company_number { '194632819' }
      company_type { :limited_company }
      building_name {"the-shard"}
      street_name { Faker::Address.street_name }
      town {"westminster"}
      county {"london"}
      postcode {"wc1 1aa"}
      organisation_more_than_one_site {:"questions.respondents_details.organisation_more_than_one_site.options.no"}
      video_call {:"questions.respondents_details.video_call.options.no"}
  end

  trait :respondent_valid do
    title { :Mr }
    contact { Faker::Name.name }
    county {"london"}
    dx_number {"234242342"}
    contact_number {"02081234567"}
    contact_mobile_number {"07123456789"}
    contact_preference {:"questions.respondents_details.contact_preference.options.email"}
    email_address {"sivvoy.taing@hmcts.net"}
    organisation_employ_gb {"100"}
    make_employer_contract_claim {:"questions.employers_contract_claims.make_employer_contract_claim.options.yes"}
    claim_information {"lorem ipsum info"}
    email_receipt {"sivvoy.taing@hmcts.net"}
    disability {:"questions.disabilities.disability.options.yes"}
    disability_information {"Lorem ipsum disability"}
    video_call {:"questions.respondents_details.video_call.options.no"}
  end

  trait :contact_preference_post do
    contact_preference {:"questions.respondents_details.contact_preference.options.post"}
    email_address { nil }
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
    contact_preference {:"questions.respondents_details.contact_preference.options.fax"}
    fax_number {"string"}
    employment_at_site_number {"string"}
    organisation_employ_gb {"string"}
    make_employer_contract_claim {:"questions.employers_contract_claims.make_employer_contract_claim.options.yes"}
    claim_information {Faker::Lorem.characters(number: 4501)}
    email_receipt {""}
    disability {:"questions.disabilities.disability.options.yes"}
    disability_information { Faker::Lorem.characters(number: 351) }
    video_call {nil}
  end
end
