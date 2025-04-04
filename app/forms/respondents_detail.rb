class RespondentsDetail < BaseForm
  attribute :case_number, :string
  attribute :name, :string
  attribute :company_number, :string
  attribute :type_of_employer, :string
  attribute :title, :string
  attribute :other_title, :string
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
  attribute :organisation_employ_gb, :integer
  attribute :organisation_more_than_one_site, :boolean
  attribute :employment_at_site_number, :integer
  attribute :allow_phone_or_video_attendance

  def to_h # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    respondents_detail_hash = {
      case_number: case_number,
      name: name,
      company_number: company_number,
      type_of_employer: type_of_employer,
      title: title,
      other_title: other_title,
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
      organisation_employ_gb: organisation_employ_gb,
      organisation_more_than_one_site: organisation_more_than_one_site,
      allow_phone_or_video_attendance: allow_phone_or_video_attendance
    }

    respondents_detail_hash[:email_address] = email_address if respondents_detail_hash[:contact_preference] == "email"
    respondents_detail_hash[:employment_at_site_number] = employment_at_site_number if respondents_detail_hash[:organisation_more_than_one_site]

    respondents_detail_hash
  end

  validates :case_number, case_number: true
  validates :name, presence: true
  validates :contact,
            persons_name: true,
            allow_blank: true
  validates :building_name, :street_name, :town, presence: true
  validates :postcode, postcode: true
  validates :contact_number, :mobile_number,
            phone_number: true,
            allow_blank: true
  validates :email_address,
            email_address: true,
            if: :prefer_email?
  validates :organisation_employ_gb,
            numericality: true,
            allow_blank: true
  validates :organisation_more_than_one_site, inclusion: { in: [true, false] }, allow_blank: true
  validates :employment_at_site_number, numericality: true, if: :more_than_one_site?

  def allow_phone_or_video_attendance=(value)
    write_attribute(:allow_phone_or_video_attendance, value&.reject(&:blank?))
  end

  private

  def prefer_email?
    contact_preference == "email"
  end

  def more_than_one_site?
    organisation_more_than_one_site
  end
end
