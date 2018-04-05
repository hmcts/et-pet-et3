require 'rails_helper'
RSpec.describe DxNumberValidator do

  let(:model_class) do
    Class.new do
      include ActiveModel::Model
      attr_accessor :dx_number

      def self.name
        'MyModel'
      end

      validates :dx_number, dx_number: true
    end
  end

  # TODO: Add tests for what will/won't be validated (RST-1033)
  it 'will validate a valid DX number' do
    model = model_class.new(dx_number: "")

    model.valid?

    expect(model.errors).not_to include :dx_number
  end
end
