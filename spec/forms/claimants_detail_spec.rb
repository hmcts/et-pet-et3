require 'rails_helper'

RSpec.describe ClaimantsDetail, type: :model do

  let(:populated_claimant_detail) {
    described_class.new(
      employment_start: '01/01/2017', employment_end: '31/12/2017', claimants_name: 'Jane Doe',
      agree_with_early_conciliation_details: false, disagree_conciliation_reason: 'lorem ipsum conciliation',
      agree_with_employment_dates: false, disagree_employment: 'lorem ipsum employment',
      continued_employment: false, agree_with_claimants_description_of_job_or_title: false,
      disagree_claimants_job_or_title: 'lorem ipsum job title'
    )
  }

  context 'with validators' do

    it 'will not validate a name with numbers in' do
      populated_claimant_detail.claimants_name = "Jan3 D0e"

      populated_claimant_detail.valid?

      expect(populated_claimant_detail.errors.details[:claimants_name]).to include a_hash_including(error: :contains_numbers)
    end

  end

  context 'when correctly populated' do

    it 'returns the claimant name' do
      expect(populated_claimant_detail.claimants_name).to eql 'Jane Doe'
    end

    it 'returns agree with early conciliation details' do
      expect(populated_claimant_detail.agree_with_early_conciliation_details).to be false
    end

    it 'returns the disagree conciliation reason' do
      expect(populated_claimant_detail.disagree_conciliation_reason).to eql 'lorem ipsum conciliation'
    end

    it 'returns agree with employment dates' do
      expect(populated_claimant_detail.agree_with_employment_dates).to be false
    end

    it 'returns the employment start date' do
      expect(populated_claimant_detail.employment_start.strftime('%d/%m/%Y')).to eql '01/01/2017'
    end

    it 'returns the employment start date as a date type' do
      expect(populated_claimant_detail.employment_start).to be_a Date
    end

    it 'returns the employment end date' do
      expect(populated_claimant_detail.employment_end.strftime('%d/%m/%Y')).to eql '31/12/2017'
    end

    it 'returns the employment end date as a date type' do
      expect(populated_claimant_detail.employment_end).to be_a Date
    end

    it 'returns the disagree employment reason' do
      expect(populated_claimant_detail.disagree_employment).to eql 'lorem ipsum employment'
    end

    it 'returns the continued employment' do
      expect(populated_claimant_detail.continued_employment).to be false
    end

    it 'returns agree with claimants description of job or title' do
      expect(populated_claimant_detail.agree_with_claimants_description_of_job_or_title).to be false
    end

    it 'returns the disagree claimants job or title reason' do
      expect(populated_claimant_detail.disagree_claimants_job_or_title).to eql 'lorem ipsum job title'
    end
  end

  describe ".to_h " do
    it "will return a hash" do
      expect(populated_claimant_detail.to_h).to be_a(Hash)
    end

    it 'will return the claimants_name key and value pair' do
      expect(populated_claimant_detail.to_h).to include(claimants_name: 'Jane Doe')
    end

    it 'will return the agree_with_early_conciliation_details key and value pair' do
      expect(populated_claimant_detail.to_h).to include(agree_with_early_conciliation_details: false)
    end

    it 'will return the disagree_conciliation_reason key and value pair' do
      expect(populated_claimant_detail.to_h).to include(disagree_conciliation_reason: 'lorem ipsum conciliation')
    end

    it 'will return the agree_with_employment_dates key and value pair' do
      expect(populated_claimant_detail.to_h).to include(agree_with_employment_dates: false)
    end

    it 'will return the employment_start key and value pair' do
      expect(populated_claimant_detail.to_h[:employment_start].strftime('%d/%m/%Y')).to eql '01/01/2017'
    end

    it 'will return the employment_start value as a Date' do
      expect(populated_claimant_detail.to_h[:employment_start]).to be_a(Date)
    end

    it 'will return the employment_end key and value pair' do
      expect(populated_claimant_detail.to_h[:employment_end].strftime('%d/%m/%Y')).to eql '31/12/2017'
    end
    it 'will return the employment_end value as a Date' do
      expect(populated_claimant_detail.to_h[:employment_end]).to be_a(Date)
    end

    it 'will return the disagree_employment key and value pair' do
      expect(populated_claimant_detail.to_h).to include(disagree_employment: 'lorem ipsum employment')
    end

    it 'will return the continued_employment key and value pair' do
      expect(populated_claimant_detail.to_h).to include(continued_employment: false)
    end

    it 'will return the agree_with_claimants_description_of_job_or_title key and value pair' do
      expect(populated_claimant_detail.to_h).to include(agree_with_claimants_description_of_job_or_title: false)
    end

    it 'will return the disagree_claimants_job_or_title key and value pair' do
      expect(populated_claimant_detail.to_h).to include(disagree_claimants_job_or_title: 'lorem ipsum job title')
    end

  end

  context "when left blank" do
    it 'will not raise a validation error on claimants name' do
      populated_claimant_detail.claimants_name = nil

      populated_claimant_detail.valid?

      expect(populated_claimant_detail).to be_valid
    end

    it 'will not raise a validation error on agree with early conciliation details' do
      populated_claimant_detail.agree_with_early_conciliation_details = nil

      populated_claimant_detail.valid?

      expect(populated_claimant_detail).to be_valid
    end

    it 'will raise a validation error on agree with employment dates' do
      populated_claimant_detail.agree_with_employment_dates = nil

      populated_claimant_detail.valid?

      expect(populated_claimant_detail.errors.details[:agree_with_employment_dates]).to include a_hash_including(error: :inclusion)
    end

    it 'will not raise a validation error on continued employment' do
      populated_claimant_detail.continued_employment = nil

      populated_claimant_detail.valid?

      expect(populated_claimant_detail).to be_valid
    end

    it 'will not raise a validation error on agree with claimants description of job or title' do
      populated_claimant_detail.agree_with_claimants_description_of_job_or_title = nil

      populated_claimant_detail.valid?

      expect(populated_claimant_detail).to be_valid
    end
  end

  context "when disagreeing with early conciliation reason" do
    it 'will not raise a validation error on disagree conciliation reason' do
      populated_claimant_detail.agree_with_early_conciliation_details = false
      populated_claimant_detail.disagree_conciliation_reason = nil

      populated_claimant_detail.valid?

      expect(populated_claimant_detail).to be_valid
    end
  end

  context "when disagreeing with employment dates" do
    it 'will raise a validation error on employment start' do
      populated_claimant_detail.agree_with_employment_dates = false
      populated_claimant_detail.employment_start = nil

      populated_claimant_detail.valid?

      expect(populated_claimant_detail.errors.details[:employment_start]).to include a_hash_including(error: :blank)
    end

    it 'will raise a validation error on employment end' do
      populated_claimant_detail.agree_with_employment_dates = false
      populated_claimant_detail.employment_end = nil

      populated_claimant_detail.valid?

      expect(populated_claimant_detail.errors.details[:employment_end]).to include a_hash_including(error: :blank)
    end

    it 'will raise a validation error on disagree employment' do
      populated_claimant_detail.agree_with_employment_dates = false
      populated_claimant_detail.disagree_employment = nil

      populated_claimant_detail.valid?

      expect(populated_claimant_detail.errors.details[:disagree_employment]).to include a_hash_including(error: :blank)
    end
  end

  context "when disagreeing with description of job or title" do
    it 'will not raise a validation error on disagree claimants job or title' do
      populated_claimant_detail.agree_with_claimants_description_of_job_or_title = false
      populated_claimant_detail.disagree_claimants_job_or_title = nil

      populated_claimant_detail.valid?

      expect(populated_claimant_detail).to be_valid
    end
  end
end
