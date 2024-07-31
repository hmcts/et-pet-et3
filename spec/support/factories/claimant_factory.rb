require 'faker'

FactoryBot.define do
  factory :claimant, class: OpenStruct do
  end

  trait :claimant_valid do
    claimants_name { Faker::Name.name }
    agree_with_early_conciliation_details {:"questions.claimants_details.agree_with_early_conciliation_details.options.no"}
    disagree_conciliation_reason {"lorem ipsum conciliation"}
    continued_employment {:no}
    agree_with_claimants_description_of_job_or_title { :no }
    disagree_claimants_job_or_title {"lorem ipsum job title"}
    agree_with_claimants_hours {:no}
    queried_hours {32.0}
    agree_with_earnings_details {:no}
    queried_pay_before_tax {1000.0}
    queried_pay_before_tax_period {:"questions.earnings_and_benefits.queried_pay_before_tax_period.options.monthly"}
    queried_take_home_pay {900.0}
    queried_take_home_pay_period {:"questions.earnings_and_benefits.queried_take_home_pay_period.options.monthly"}
    agree_with_claimant_notice {:no}
    disagree_claimant_notice_reason {"lorem ipsum notice reason"}
    agree_with_claimant_pension_benefits {:"questions.earnings_and_benefits.agree_with_claimant_pension_benefits.options.no"}
    disagree_claimant_pension_benefits_reason {"lorem ipsum claimant pension"}
    defend_claim {:"questions.responses.defend_claim.options.yes"}
    defend_claim_facts {"lorem ipsum defence"}
    agree_with_employment_dates {:no}
    employment_start {"01/01/2017"}
    employment_end {"31/12/2017"}
    disagree_employment {"lorem ipsum employment"}
  end

  trait :claimant_invalid do
    claimants_name {"J4ne D0e"}
    agree_with_early_conciliation_details {:"questions.claimants_details.agree_with_early_conciliation_details.options.yes"}
    disagree_conciliation_reason {nil}
    continued_employment {:no}
    agree_with_claimants_description_of_job_or_title { :yes }
    disagree_claimants_job_or_title {nil}
    agree_with_claimants_hours {:no}
    queried_hours {"string"}
    agree_with_earnings_details {:no}
    queried_pay_before_tax {"string"}
    queried_pay_before_tax_period {:"questions.earnings_and_benefits.queried_pay_before_tax_period.options.weekly"}
    queried_take_home_pay {"string"}
    queried_take_home_pay_period {:"questions.earnings_and_benefits.queried_take_home_pay_period.options.weekly"}
    agree_with_claimant_notice {:no}
    disagree_claimant_notice_reason { Faker::Lorem.characters(number: 451) }
    agree_with_claimant_pension_benefits {:"questions.earnings_and_benefits.agree_with_claimant_pension_benefits.options.no"}
    disagree_claimant_pension_benefits_reason { Faker::Lorem.characters(number: 351) }
    defend_claim {:"questions.responses.defend_claim.options.yes"}
    defend_claim_facts { Faker::Lorem.characters(number: 2501) }
    agree_with_employment_dates {:no}
    employment_start {"0/0/0"}
    employment_end {"0/0/0"}
    disagree_employment {nil}
  end

  trait :claimant_invalid_dates do
    claimant_invalid
    employment_start {"01/01/2021"}
    employment_end {"01/01/2020"}
  end
end
