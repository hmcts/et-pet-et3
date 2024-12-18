class Disability < BaseForm
  attribute :disability, :string
  attribute :disability_information, :text

  def to_h
    disability_hash = {
      disability: disability
    }

    disability_hash[:disability_information] = disability_information if disabled?

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
    disability == 'true'
  end
end
