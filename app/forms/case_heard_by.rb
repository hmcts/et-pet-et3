class CaseHeardBy < BaseForm
  attribute :case_heard_by_preference, :string
  attribute :case_heard_by_preference_reason, :string

  validates :case_heard_by_preference, inclusion: { in: ['judge', 'panel', 'no_preference', nil] }
  validates :case_heard_by_preference_reason, presence: true, if: -> { case_heard_by_preference.in?(%w[judge panel]) }
  before_validation :clear_reason

  def to_h # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    {
      case_heard_by_preference:,
      case_heard_by_preference_reason:,
    }
  end

  private

  def clear_reason
    self.case_heard_by_preference_reason = nil unless case_heard_by_preference.in?(%w[judge panel])
  end
end
