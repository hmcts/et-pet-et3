require 'rails_helper'

RSpec.describe EarningsAndBenefits, type: :model do

  let(:populated_earnings_and_benefits) {
    described_class.new(
      agree_with_claimants_hours: false,
      queried_hours: 20.5,
      agree_with_earnings_details: false,
      queried_pay_before_tax: 900.25,
      queried_pay_before_tax_period: 'weekly',
      queried_take_home_pay: 100.50,
      queried_take_home_pay_period: 'weekly',
      agree_with_claimant_notice: false,
      disagree_claimant_notice_reason: 'lorem ipsum notice',
      agree_with_claimant_pension_benefits: false,
      disagree_claimant_pension_benefits_reason: 'lorem ipsum pension'
    )
  }

  let(:four_hundred_and_one_chars) {
    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.
    Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis,
    ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo,
    fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a,'
  }

  let(:three_hundred_fifty_one_chars) {
    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.
    Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis,
    ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo,
    fringilla vel, aliquet nec, vulputate e'
  }

  context 'with validators' do
    it 'will not validate queried hours with a string' do
      populated_earnings_and_benefits.queried_hours = 'string'

      populated_earnings_and_benefits.valid?

      expect(populated_earnings_and_benefits.errors.details[:queried_hours]).to include a_hash_including(error: :not_a_number)
    end

    it 'will not validate queried pay before tax with a string' do
      populated_earnings_and_benefits.queried_pay_before_tax = 'string'

      populated_earnings_and_benefits.valid?

      expect(populated_earnings_and_benefits.errors.details[:queried_pay_before_tax]).to include a_hash_including(error: :not_a_number)
    end

    it 'will not validate queried take home pay with a string' do
      populated_earnings_and_benefits.queried_take_home_pay = 'string'

      populated_earnings_and_benefits.valid?

      expect(populated_earnings_and_benefits.errors.details[:queried_take_home_pay]).to include a_hash_including(error: :not_a_number)
    end

    it 'will not validate disagree claimant reason over 400 characters' do
      populated_earnings_and_benefits.disagree_claimant_notice_reason = four_hundred_and_one_chars

      populated_earnings_and_benefits.valid?

      expect(populated_earnings_and_benefits.errors.details[:disagree_claimant_notice_reason]).to include a_hash_including(error: :too_long)
    end

    it 'will not validate disagree pension benefits reason over 350 characters' do
      populated_earnings_and_benefits.disagree_claimant_pension_benefits_reason = three_hundred_fifty_one_chars

      populated_earnings_and_benefits.valid?

      expect(populated_earnings_and_benefits.errors.details[:disagree_claimant_pension_benefits_reason]).to include a_hash_including(error: :too_long)
    end
  end

  context 'when correctly populated' do

    it 'returns the correct claimants hours' do
      expect(populated_earnings_and_benefits.agree_with_claimants_hours).to be false
    end

    it 'returns the correct queried hours' do
      expect(populated_earnings_and_benefits.queried_hours).to be 20.5
    end

    it 'returns the correct earnings details' do
      expect(populated_earnings_and_benefits.agree_with_earnings_details).to be false
    end

    it 'returns the correct queried_pay_before_tax' do
      expect(populated_earnings_and_benefits.queried_pay_before_tax).to be 900.25
    end

    it 'returns the correct queried_pay_before_tax_period' do
      expect(populated_earnings_and_benefits.queried_pay_before_tax_period).to eql 'weekly'
    end

    it 'returns the correct queried_take_home_pay' do
      expect(populated_earnings_and_benefits.queried_take_home_pay).to be 100.5
    end

    it 'returns the correct queried_take_home_pay_period' do
      expect(populated_earnings_and_benefits.queried_take_home_pay_period).to eql 'weekly'
    end

    it 'returns the correct claimant_notice' do
      expect(populated_earnings_and_benefits.agree_with_claimant_notice).to be false
    end

    it 'returns the correct disagree claimant notice' do
      expect(populated_earnings_and_benefits.disagree_claimant_notice_reason).to eql 'lorem ipsum notice'
    end

    it 'returns the correct claimant_pension_benefits' do
      expect(populated_earnings_and_benefits.agree_with_claimant_pension_benefits).to be false
    end

    it 'returns the correct disagree' do
      expect(populated_earnings_and_benefits.disagree_claimant_pension_benefits_reason).to eql 'lorem ipsum pension'
    end
  end

  describe ".to_h " do
    it "will return a hash" do
      expect(populated_earnings_and_benefits.to_h).to be_a(Hash)
    end

    it 'will return the agree_with_claimants_hours key and value pair' do
      expect(populated_earnings_and_benefits.to_h).to include(agree_with_claimants_hours: false)
    end

    it 'will return the queried_hours key and value pair' do
      expect(populated_earnings_and_benefits.to_h).to include(queried_hours: 20.5)
    end

    it 'will return the agree_with_earnings_details key and value pair' do
      expect(populated_earnings_and_benefits.to_h).to include(agree_with_earnings_details: false)
    end

    it 'will return the queried_pay_before_tax key and value pair' do
      expect(populated_earnings_and_benefits.to_h).to include(queried_pay_before_tax: 900.25)
    end

    it 'will return the queried_pay_before_tax_period key and value pair' do
      expect(populated_earnings_and_benefits.to_h).to include(queried_pay_before_tax_period: 'weekly')
    end

    it 'will return the queried_take_home_pay key and value pair' do
      expect(populated_earnings_and_benefits.to_h).to include(queried_take_home_pay: 100.5)
    end

    it 'will return the queried_take_home_pay_period key and value pair' do
      expect(populated_earnings_and_benefits.to_h).to include(queried_take_home_pay_period: 'weekly')
    end

    it 'will return the agree_with_claimant_notice key and value pair' do
      expect(populated_earnings_and_benefits.to_h).to include(agree_with_claimant_notice: false)
    end

    it 'will return the disagree_claimant_notice_reason key and value pair' do
      expect(populated_earnings_and_benefits.to_h).to include(disagree_claimant_notice_reason: 'lorem ipsum notice')
    end

    it 'will return the agree_with_claimant_pension_benefits key and value pair' do
      expect(populated_earnings_and_benefits.to_h).to include(agree_with_claimant_pension_benefits: false)
    end

    it 'will return the disagree_claimant_pension_benefits_reason key and value pair' do
      expect(populated_earnings_and_benefits.to_h).to include(disagree_claimant_pension_benefits_reason: 'lorem ipsum pension')
    end

  end

  context 'when left blank' do
    it 'will not raise a validation error on agree with claimants hours' do
      populated_earnings_and_benefits.agree_with_claimants_hours = nil

      expect(populated_earnings_and_benefits).to be_valid
    end

    it 'will not raise a validation error on queried_hours' do
      populated_earnings_and_benefits.queried_hours = nil

      expect(populated_earnings_and_benefits).to be_valid
    end

    it 'will not raise a validation error on agree_with_earnings_details ' do
      populated_earnings_and_benefits.agree_with_earnings_details = nil

      expect(populated_earnings_and_benefits).to be_valid
    end

    it 'will not raise a validation error on queried_pay_before_tax' do
      populated_earnings_and_benefits.queried_pay_before_tax = nil

      expect(populated_earnings_and_benefits).to be_valid
    end

    it 'will not raise a validation error on queried_pay_before_tax_period' do
      populated_earnings_and_benefits.queried_pay_before_tax_period = nil

      expect(populated_earnings_and_benefits).to be_valid
    end

    it 'will not raise a validation error on queried_take_home_pay' do
      populated_earnings_and_benefits.queried_take_home_pay = nil

      expect(populated_earnings_and_benefits).to be_valid
    end

    it 'will not raise a validation error on queried_take_home_pay_period' do
      populated_earnings_and_benefits.queried_take_home_pay_period = nil

      expect(populated_earnings_and_benefits).to be_valid
    end

    it 'will not raise a validation error on agree_with_claimant_notice' do
      populated_earnings_and_benefits.agree_with_claimant_notice = nil

      expect(populated_earnings_and_benefits).to be_valid
    end

    it 'will not raise a validation error on disagree_claimant_notice_reason' do
      populated_earnings_and_benefits.disagree_claimant_notice_reason = nil

      expect(populated_earnings_and_benefits).to be_valid
    end

    it 'will not raise a validation error on agree_with_claimant_pension_benefits' do
      populated_earnings_and_benefits.agree_with_claimant_pension_benefits = nil

      expect(populated_earnings_and_benefits).to be_valid
    end

    it 'will not raise a validation error on disagree_with_claimant_pension_benefits_reason' do
      populated_earnings_and_benefits.disagree_claimant_pension_benefits_reason = nil

      expect(populated_earnings_and_benefits).to be_valid
    end
  end
end
