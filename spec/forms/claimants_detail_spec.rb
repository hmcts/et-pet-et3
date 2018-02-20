require 'rails_helper'

RSpec.describe ClaimantsDetail, type: :model do

  context 'when correctly populated' do

    it 'with claimant name only' do
      claimant_detail = described_class.new(claimants_name: 'jane')

      expect(claimant_detail.claimants_name).to eql 'jane'
    end

    it 'with early conciliation details only' do
      claimant_detail = described_class.new(early_conciliation_details: true)

      expect(claimant_detail.early_conciliation_details).to be true
    end

    it 'with employment dates only' do
      claimant_detail = described_class.new(employment_dates: true)

      expect(claimant_detail.employment_dates).to be true
    end

    it 'with continued employment only' do
      claimant_detail = described_class.new(continued_employment: false)

      expect(claimant_detail.continued_employment).to be false
    end

    it 'with claimants description of job or title only' do
      claimant_detail = described_class.new(claimants_description_of_job_or_title: true)

      expect(claimant_detail.claimants_description_of_job_or_title).to be true
    end
  end

end
