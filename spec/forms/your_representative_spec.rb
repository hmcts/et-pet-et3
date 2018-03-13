require 'rails_helper'

RSpec.describe YourRepresentative, type: :model do

  context 'when correctly populated' do

    it 'with have_representative only' do
      your_representative = described_class.new(have_representative: true)

      expect(your_representative.have_representative).to be true
    end

  end

  describe ".to_h " do
    it "will take two strings and convert them into a hash" do
      your_representative = described_class.new(have_representative: true)

      expect(your_representative.to_h).to be_a(Hash)
    end

    it 'will return the value for a key' do
      your_representative = described_class.new(have_representative: true)

      expect(your_representative.to_h).to include(have_representative: true)
    end
  end
end
