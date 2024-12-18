require 'rails_helper'

RSpec.describe ConfirmationOfSuppliedDetails, type: :model do

  let(:populated_confirmation_of_supplied_details) { described_class.new(email_receipt: 'test@example.com') }

  context 'when correctly populated' do

    it 'returns the correct email receipt' do
      expect(populated_confirmation_of_supplied_details.email_receipt).to eql 'test@example.com'
    end

  end

  describe ".to_h" do
    it "returns a hash" do
      expect(populated_confirmation_of_supplied_details.to_h).to be_a(Hash)
    end

    it 'returns the have_representative key and value pair' do
      expect(populated_confirmation_of_supplied_details.to_h).to include(email_receipt: 'test@example.com')
    end
  end

  context 'when left blank' do
    it 'does not raise a validation error on email_receipt' do
      populated_confirmation_of_supplied_details.email_receipt = nil

      populated_confirmation_of_supplied_details.valid?

      expect(populated_confirmation_of_supplied_details).to be_valid
    end
  end
end
