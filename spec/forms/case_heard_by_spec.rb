require 'rails_helper'

RSpec.describe CaseHeardBy, type: :model do

  let(:form) {
    described_class.new(case_heard_by_preference: 'judge', case_heard_by_preference_reason: 'I feel intimidated by a group'
    )
  }

  context 'when correctly populated' do

    it 'returns the correct case_heard_by_preference' do
      expect(form.case_heard_by_preference).to eql 'judge'
    end

    it 'returns the correct case_heard_by_preference_reason' do
      expect(form.case_heard_by_preference_reason).to eql 'I feel intimidated by a group'
    end
  end

  describe ".to_h " do
    it "will return a hash" do
      expect(form.to_h).to be_a(Hash)
    end

    it 'will return the case_heard_by_preference key and value pair' do
      expect(form.to_h).to include(case_heard_by_preference: 'judge')
    end

    it 'will return the case_heard_by_preference_reason key and value pair' do
      expect(form.to_h).to include(case_heard_by_preference_reason: 'I feel intimidated by a group')
    end
  end

  context 'validation' do
    it 'will not raise a validation error on case_heard_by_preference' do
      form.case_heard_by_preference = nil

      form.valid?

      expect(form.errors.details[:case_heard_by_preference]).to be_empty
    end

    it 'will raise a validation error if case_heard_by_preference is not included in the list' do
      form.case_heard_by_preference = 'not_included'

      form.valid?

      expect(form.errors.details[:case_heard_by_preference]).to include a_hash_including(error: :inclusion)
    end
  end

  context 'case_heard_by_preference_reason blanking' do
    it 'will set case_heard_by_preference_reason to nil if the case_heard_by_preference is no_preference' do
      form.case_heard_by_preference = 'no_preference'
      form.case_heard_by_preference_reason = 'I feel intimidated by a group'

      form.valid?

      expect(form.case_heard_by_preference_reason).to be_nil
    end

    it 'will not set case_heard_by_preference_reason to nil if the case_heard_by_preference is not no_preference' do
      form.case_heard_by_preference = 'judge'
      form.case_heard_by_preference_reason = 'I feel intimidated by a group'

      form.valid?

      expect(form.case_heard_by_preference_reason).to eql 'I feel intimidated by a group'
    end

    it 'will set case_heard_by_preference_reason to nil if the case_heard_by_preference is nil' do
      form.case_heard_by_preference = nil
      form.case_heard_by_preference_reason = 'I feel intimidated by a group'

      form.valid?

      expect(form.case_heard_by_preference_reason).to be_nil
    end
  end
end
