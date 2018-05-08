class ConfirmationOfSuppliedDetails < BaseForm
  attribute :email_receipt, :string

  def to_h
    {
      email_receipt: email_receipt,
    }
  end

  validates :email_receipt,
    email_address: true,
    allow_blank: true
end
