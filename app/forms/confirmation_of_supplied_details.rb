class ConfirmationOfSuppliedDetails < BaseForm
  attribute :email_receipt, :string
  attribute :confirm_email_receipt, :string

  def to_h
    {
      email_receipt: email_receipt,
      email_receipt_confirmation: email_receipt_confirmation
    }
  end

  validates :email_receipt,
    confirmation: true,
    email_address: true,
    allow_blank: true
end
