require 'faker'

FactoryBot.define do
  factory :claimant, class: OpenStruct do
  end

  trait :claimant_valid do
    claimants_name { Faker::Name.name }
    agree_with_early_conciliation_details {:"questions.agree_with_early_conciliation_details.no.label"}
    disagree_conciliation_reason {"lorem ipsum conciliation"}
    continued_employment {:"questions.continued_employment.no.label"}
    agree_with_claimants_description_of_job_or_title {:"questions.agree_with_claimants_description_of_job_or_title.no.label"}
    disagree_claimants_job_or_title {"lorem ipsum job title"}
    agree_with_claimants_hours {:"questions.agree_with_claimants_hours.no.label"}
    queried_hours {32.0}
    agree_with_earnings_details {:"questions.agree_with_earnings_details.no.label"}
    queried_pay_before_tax {1000.0}
    queried_pay_before_tax_period {:"questions.agree_with_earnings_details.queried_pay_before_tax_period.monthly.label"}
    queried_take_home_pay {900.0}
    queried_take_home_pay_period {:"questions.agree_with_earnings_details.queried_take_home_pay_period.monthly.label"}
    agree_with_claimant_notice {:"questions.agree_with_claimant_notice.no.label"}
    disagree_claimant_notice_reason {"lorem ipsum notice reason"}
    agree_with_claimant_pension_benefits {:"questions.agree_with_claimant_pension_benefits.no.label"}
    disagree_claimant_pension_benefits_reason {"lorem ipsum claimant pension"}
    defend_claim {:"questions.defend_claim.yes.label"}
    defend_claim_facts {"lorem ipsum defence"}
    agree_with_employment_dates {:"questions.agree_with_employment_dates.no.label"}
    employment_start {"01/01/2017"}
    employment_end {"31/12/2017"}
    disagree_employment {"lorem ipsum employment"}
  end

  trait :claimant_invalid do
    claimants_name {"J4ne D0e"}
    agree_with_early_conciliation_details {:"questions.agree_with_early_conciliation_details.yes.label"}
    disagree_conciliation_reason {nil}
    continued_employment {:"questions.continued_employment.no.label"}
    agree_with_claimants_description_of_job_or_title {:"questions.agree_with_claimants_description_of_job_or_title.yes.label"}
    disagree_claimants_job_or_title {nil}
    agree_with_claimants_hours {:"questions.agree_with_claimants_hours.no.label"}
    queried_hours {"string"}
    agree_with_earnings_details {:"questions.agree_with_earnings_details.no.label"}
    queried_pay_before_tax {"string"}
    queried_pay_before_tax_period {:"questions.agree_with_earnings_details.queried_pay_before_tax_period.weekly.label"}
    queried_take_home_pay {"string"}
    queried_take_home_pay_period {:"questions.agree_with_earnings_details.queried_take_home_pay_period.weekly.label"}
    agree_with_claimant_notice {:"questions.agree_with_claimant_notice.no.label"}
    disagree_claimant_notice_reason { Faker::Lorem.characters(451) }
    agree_with_claimant_pension_benefits {:"questions.agree_with_claimant_pension_benefits.no.label"}
    disagree_claimant_pension_benefits_reason { Faker::Lorem.characters(351) }
    defend_claim {:"questions.defend_claim.yes.label"}
    defend_claim_facts { Faker::Lorem.characters(2501) }
    agree_with_employment_dates {:"questions.agree_with_employment_dates.no.label"}
    employment_start {"0/0/0"}
    employment_end {"0/0/0"}
    disagree_employment {nil}
  end
end