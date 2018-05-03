class YourRepresentativesDetails < BaseForm
  attribute :type_of_representative, :string
  attribute :representative_org_name, :string
  attribute :representative_name, :string
  attribute :representative_building, :string
  attribute :representative_street, :string
  attribute :representative_town, :string
  attribute :representative_county, :string
  attribute :representative_postcode, :string
  attribute :representative_phone, :string
  attribute :representative_mobile, :string
  attribute :representative_dx_number, :string
  attribute :representative_reference, :string
  attribute :representative_contact_preference, :string
  attribute :representative_email, :string
  attribute :representative_fax, :string
  attribute :representative_disability, :boolean
  attribute :representative_disability_information, :text

  def to_h # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    {
      type_of_representative: type_of_representative,
      representative_org_name: representative_org_name,
      representative_name: representative_name,
      representative_building: representative_building,
      representative_street: representative_street,
      representative_town: representative_town,
      representative_county: representative_county,
      representative_postcode: representative_postcode,
      representative_phone: representative_phone,
      representative_mobile: representative_mobile,
      representative_dx_number: representative_dx_number,
      representative_reference: representative_reference,
      representative_contact_preference: representative_contact_preference,
      representative_email: representative_email,
      representative_fax: representative_fax,
      representative_disability: representative_disability,
      representative_disability_information: representative_disability_information
    }
  end

  validates :type_of_representative,
    inclusion: {
      in: [
        "Citizens Advice Bureau",
        "Free Representation Unit",
        "Law Centre",
        "Union",
        "Solicitor",
        "Private Individual",
        "Trade Association",
        "Other"
      ]
    }
  validates :representative_name,
    presence: true,
    if: proc { |c| c.representative_name.blank? }
  validates :representative_name,
    persons_name: true,
    unless: proc { |c| c.representative_name.blank? }
  validates :representative_building,
    :representative_street,
    :representative_town,
    presence: true
  validates :representative_postcode, postcode: true
  validates :representative_phone, :representative_mobile,
    phone_number: true,
    allow_blank: true
  validates :representative_email,
    email_address: true,
    if: :prefer_email?
  validates :representative_fax,
    phone_number: true,
    if: :prefer_fax?
  validates :representative_disability_information,
    length: {
      maximum: 350,
      too_long: "%{count} characters is the maximum allowed" # rubocop:disable Style/FormatStringToken
    },
    presence: true,
    if: :representative_is_disabled?

  private

  def prefer_email?
    representative_contact_preference == "email"
  end

  def prefer_fax?
    representative_contact_preference == "fax"
  end

  def representative_is_disabled?
    representative_disability
  end
end
