require 'rails_helper'

RSpec.describe YourRepresentative, type: :model do

  context 'when correctly populated' do

    it 'with have_representative only' do
      your_representative = described_class.new(have_representative: true)

      expect(your_representative.have_representative).to be true
    end

  end
end
