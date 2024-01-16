require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    subject { described_class.new(user_attributes) }

    let(:user_attributes){ attributes_for(:user) }
    it 'creates reference number' do
      expect(subject.reference).to match(/\A\w{4}-\w{4}\z/)
    end
  end
end
