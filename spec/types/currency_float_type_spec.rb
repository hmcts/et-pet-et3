require 'rails_helper'
RSpec.describe CurrencyFloatType do
  describe '#cast' do
    subject(:type) { described_class.new }

    it 'casts a float encased in a string to a float' do
      expect(type.cast('12345.67')).to be 12345.67
    end

    it 'casts an integer encased in a string to a float' do
      expect(type.cast('12345')).to be 12345.00
    end

    it 'does not cast an integer' do
      expect(type.cast(12345)).to be 12345
    end

    it 'casts strings with a GBP (£) character to a float' do
      expect(type.cast('£12345.67')).to be 12345.67
    end

    it 'does not cast a float' do
      expect(type.cast(12345.67)).to be 12345.67
    end

    it 'casts strings with a comma (,) to a float' do
      expect(type.cast('12,345.67')).to be 12345.67
    end

    it 'does not cast letters' do
      expect(type.cast('string')).to eql 'string'
    end

    it 'casts strings without surrounding whitespace to floats' do
      expect(type.cast('     £12,345.67   ')).to be 12345.67
    end

    it 'casts strings with 3dp to floats with 2dp by truncating' do
      expect(type.cast('12345.678')).to be 12345.67
    end

    it 'casts floats with 6dp to floats with 2dp by truncating' do
      expect(type.cast(12345.678901)).to be 12345.67
    end
  end

end
