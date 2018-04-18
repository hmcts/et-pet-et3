require 'rails_helper'

RSpec.describe YourRepresentative, type: :model do

  let(:populated_your_representative) { described_class.new(have_representative: true) }

  context 'when correctly populated' do

    it 'returns the correct have representative' do
      expect(populated_your_representative.have_representative).to be true
    end

  end

  describe ".to_h " do
    it "will return a hash" do
      expect(populated_your_representative.to_h).to be_a(Hash)
    end

    it 'will return the have_representative key and value pair' do
      expect(populated_your_representative.to_h).to include(have_representative: true)
    end
  end

  context 'when left blank' do
    it 'will not raise a validation error on have representative' do
      populated_your_representative.have_representative = nil

      populated_your_representative.valid?

      expect(populated_your_representative).to be_valid
    end
  end
end
