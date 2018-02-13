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

end
