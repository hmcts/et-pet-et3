class ClaimantsDetail < BaseForm
  attribute :claimants_name, :string
  attribute :early_conciliation_details, :boolean
  attribute :employment_dates, :boolean
  attribute :continued_employment, :boolean
  attribute :claimants_description_of_job_or_title, :boolean
end
