require 'rails_helper'
RSpec.describe CaseNumberValidator do

  let(:model_class) do
    Class.new do
      include ActiveModel::Model
      attr_accessor :case_number

      def self.name
        'MyModel'
      end

      validates :case_number, case_number: true
    end
  end

  it 'will validate a string containing 7 digits followed by a slash followed by another 4 digits' do
    model = model_class.new(case_number: "7654321/2017")

    model.valid?

    expect(model.errors).not_to include :case_number
  end

  it 'will not validate a string with letters in it' do
    model = model_class.new(case_number: "a654321/2017")

    model.valid?

    expect(model.errors.details[:case_number]).to include a_hash_including(error: :invalid)
  end

  it 'will not validate a string with less than 7 digits before the slash' do
    model = model_class.new(case_number: "654321/2017")

    model.valid?

    expect(model.errors.details[:case_number]).to include a_hash_including(error: :invalid)
  end

  it 'will not validate a string with less than 4 digits after the slash' do
    model = model_class.new(case_number: "7654321/201")

    model.valid?

    expect(model.errors.details[:case_number]).to include a_hash_including(error: :invalid)
  end

  it 'will not validate a string with a slash anywhere other than the correct place' do
    model = model_class.new(case_number: "765432/12017")

    model.valid?

    expect(model.errors.details[:case_number]).to include a_hash_including(error: :invalid)
  end

  it 'will not validate a string with a symbol in it' do
    model = model_class.new(case_number: "76@432/12017")

    model.valid?

    expect(model.errors.details[:case_number]).to include a_hash_including(error: :invalid)
  end

end
