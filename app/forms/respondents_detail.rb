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
  attribute :organisation_site_number, :integer
  attribute :employment_at_site_number, :integer

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
