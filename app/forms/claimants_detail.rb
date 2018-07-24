class ClaimantsDetail < BaseForm
  acts_as_gov_uk_date :employment_start, :employment_end,
    validate_if: :disagree_with_employment_dates?
  attribute :claimants_name, :string
  attribute :agree_with_early_conciliation_details, :boolean
  attribute :disagree_conciliation_reason, :text
  attribute :agree_with_employment_dates, :boolean
  attribute :employment_start, :date
  attribute :employment_end, :date
  attribute :disagree_employment, :text
  attribute :continued_employment, :boolean
  attribute :agree_with_claimants_description_of_job_or_title, :boolean
  attribute :disagree_claimants_job_or_title, :text

  def to_h # rubocop:disable Metrics/MethodLength
    claimants_detail_hash = {
      claimants_name: claimants_name,
      agree_with_early_conciliation_details: agree_with_early_conciliation_details,
      agree_with_employment_dates: agree_with_employment_dates,
      continued_employment: continued_employment,
      agree_with_claimants_description_of_job_or_title: agree_with_claimants_description_of_job_or_title,
    }

    claimants_detail_hash[:disagree_conciliation_reason] = disagree_conciliation_reason if claimants_detail_hash[:agree_with_early_conciliation_details] == false
    if claimants_detail_hash[:agree_with_employment_dates] == false
      claimants_detail_hash.merge!(employment_start: employment_start,
                                   employment_end: employment_end,
                                   disagree_employment: disagree_employment)
    end
    claimants_detail_hash[:disagree_claimants_job_or_title] = disagree_claimants_job_or_title if claimants_detail_hash[:agree_with_claimants_description_of_job_or_title] == false

    claimants_detail_hash
  end

  validates :claimants_name,
    persons_name: true,
    allow_blank: true
  validates :agree_with_employment_dates, inclusion: { in: [true, false] }
  validates :employment_start, :employment_end, :disagree_employment,
    presence: true,
    if: :disagree_with_employment_dates?

  private

  def disagree_with_employment_dates?
    agree_with_employment_dates == false
  end

end
