class ClaimantsDetail < BaseForm
  attribute :claimants_name, :string
  attribute :agree_with_early_conciliation_details, :boolean
  attribute :disagree_conciliation_reason, :text
  attribute :agree_with_employment_dates, :string
  attribute :employment_start, :et_date
  attribute :employment_end, :et_date
  attribute :disagree_employment, :text
  attribute :continued_employment, :string
  attribute :agree_with_claimants_description_of_job_or_title, :string
  attribute :disagree_claimants_job_or_title, :text

  def to_h # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    claimants_detail_hash = {
      claimants_name: claimants_name,
      agree_with_early_conciliation_details: agree_with_early_conciliation_details,
      agree_with_employment_dates: agree_with_employment_dates,
      continued_employment: continued_employment,
      agree_with_claimants_description_of_job_or_title: agree_with_claimants_description_of_job_or_title
    }

    claimants_detail_hash[:disagree_conciliation_reason] = disagree_conciliation_reason if claimants_detail_hash[:agree_with_early_conciliation_details] == false
    if claimants_detail_hash[:agree_with_employment_dates] == 'false'
      claimants_detail_hash.merge!(employment_start: employment_start,
                                   employment_end: employment_end,
                                   disagree_employment: disagree_employment)
    end
    claimants_detail_hash[:disagree_claimants_job_or_title] = disagree_claimants_job_or_title if claimants_detail_hash[:agree_with_claimants_description_of_job_or_title] == 'false'

    claimants_detail_hash
  end

  validates :claimants_name,
            persons_name: true,
            allow_blank: true
  validates :agree_with_employment_dates, inclusion: { in: ['true', 'false', 'not_applicable'] }, allow_blank: true
  validates :employment_start, :employment_end,
            date: true, allow_blank: true,
            if: :disagree_with_employment_dates?
  validate :end_date_is_after_start_date,
           if: :disagree_with_employment_dates?

  private

  def disagree_with_employment_dates?
    agree_with_employment_dates == 'false'
  end

  def end_date_is_after_start_date
    return if employment_end.blank? || employment_start.blank?

    if employment_end < employment_start
      errors.add(:employment_end, :employment_end_before_start)
    end
  end

end
