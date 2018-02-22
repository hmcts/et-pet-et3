class ClaimantsDetail < BaseForm
  attribute :claimants_name, :string
  attribute :early_conciliation_details, :boolean
  attribute :disagree_conciliation_reason, :text
  attribute :employment_dates, :boolean
  attribute :employment_start, :datetime
  attribute :employment_end, :datetime
  attribute :disagree_employment, :text
  attribute :continued_employment, :boolean
  attribute :claimants_description_of_job_or_title, :boolean
  attribute :disagree_claimants_job_or_title, :text
end
