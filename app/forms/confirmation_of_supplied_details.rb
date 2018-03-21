class ConfirmationOfSuppliedDetails < BaseForm
  attribute :email_receipt, :string
  attribute :confirm_email_receipt, :string

  def to_h
    {
      email_receipt: email_receipt,
      confirm_email_receipt: confirm_email_receipt
    }
  end
end
