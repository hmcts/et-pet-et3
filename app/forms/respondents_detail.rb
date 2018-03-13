class RespondentsDetail < BaseForm
  attribute :case_number, :string
  attribute :name, :string
  attribute :contact, :string
  attribute :building_name, :string
  attribute :street_name, :string
  attribute :town, :string
  attribute :county, :string
  attribute :postcode, :string
  attribute :dx_number, :string
  attribute :contact_number, :string
  attribute :mobile_number, :string
  attribute :contact_preference, :string
  attribute :email_address, :string
  attribute :fax_number, :string
  attribute :organisation_employ_gb, :integer
  attribute :organisation_more_than_one_site, :boolean
  attribute :employment_at_site_number, :integer

  # TODO: Fix rubocop error
  def to_h # rubocop:disable Metrics/MethodLength
    {
      case_number: case_number,
      name: name,
      contact: contact,
      building_name: building_name,
      street_name: street_name,
      town: town,
      county: county,
      postcode: postcode,
      dx_number: dx_number,
      contact_number: contact_number,
      mobile_number: mobile_number,
      contact_preference: contact_preference,
      email_address: email_address,
      fax_number: fax_number,
      organisation_employ_gb: organisation_employ_gb,
      organisation_more_than_one_site: organisation_more_than_one_site,
      employment_at_site_number: employment_at_site_number
    }
  end

  # validates :case_number, :name, :building_name, :street_name, :town, :postcode, presence: true, on: :update
  # validates :email_address, presence: true, if: :prefer_email?
  # validates :fax_number, presence: true, if: :prefer_fax?

  # private

  # def prefer_email?
  #   contact_preference == "email"
  # end

  # def prefer_fax?
  #   contact_preference == "fax"
  # end
end
