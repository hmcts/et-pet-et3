class Disability < BaseForm
  attribute :disability, :boolean
  attribute :disability_information, :text

  def to_h
    disability_hash = {
      disability: disability
    }

    disability_hash[:disability_information] = disability_information if disability_hash[:disability]

    disability_hash
  end

  validates :disability_information,
    length: {
      maximum: 350
    },
    presence: true,
    if: :disabled?

  private

  def disabled?
    disability
  end
end
