require 'rails_helper'
RSpec.describe PersonsNameValidator do

  let(:model_class) do
    Class.new do
      include ActiveModel::Model
      attr_accessor :name

      def self.name
        'MyModel'
      end

      validates :name, persons_name: true
    end
  end

  it 'will validate any letter-based string with spaces' do
    model = model_class.new(name: "John Smith")

    model.valid?

    expect(model.errors).not_to include :name
  end

  it 'will validate any letter-based string with hyphens, apostrophes, full stops and spaces' do
    model = model_class.new(name: "John-Jo' Smith Jnr.")

    model.valid?

    expect(model.errors).not_to include :name
  end

  it 'will not validate a string with numbers in it' do
    model = model_class.new(name: "J0hn Sm1th")

    model.valid?

    expect(model.errors.details[:name]).to include a_hash_including(error: :contains_numbers)
  end

  it 'will not validate a string without spaces in it' do
    model = model_class.new(name: "JohnSmith")

    model.valid?

    expect(model.errors.details[:name]).to include a_hash_including(error: :invalid_name)
  end

end
