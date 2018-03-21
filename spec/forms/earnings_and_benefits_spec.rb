require 'rails_helper'

RSpec.describe EarningsAndBenefits, type: :model do

  context 'when correctly populated' do

    it 'agree with claimants hours only' do
      earnings_and_benefits = described_class.new(agree_with_claimants_hours: true)

      expect(earnings_and_benefits.agree_with_claimants_hours).to be true
    end

    it 'with queried hours only' do
      earnings_and_benefits = described_class.new(queried_hours: 37.5)

      expect(earnings_and_benefits.queried_hours).to be 37.5
    end

    it 'agree with earnings details only' do
      earnings_and_benefits = described_class.new(agree_with_earnings_details: true)

      expect(earnings_and_benefits.agree_with_earnings_details).to be true
    end

    it 'with queried_pay_before_tax only' do
      earnings_and_benefits = described_class.new(queried_pay_before_tax: 100)

      expect(earnings_and_benefits.queried_pay_before_tax).to be 100.00
    end

    it 'with queried_pay_before_tax_period only' do
      earnings_and_benefits = described_class.new(queried_pay_before_tax_period: 'weekly')

      expect(earnings_and_benefits.queried_pay_before_tax_period).to eql 'weekly'
    end

    it 'with queried_take_home_pay only' do
      earnings_and_benefits = described_class.new(queried_take_home_pay: 100)

      expect(earnings_and_benefits.queried_take_home_pay).to be 100.00
    end

    it 'with queried_take_home_pay_period only' do
      earnings_and_benefits = described_class.new(queried_take_home_pay_period: 'weekly')

      expect(earnings_and_benefits.queried_take_home_pay_period).to eql 'weekly'
    end

    it 'agree with claimant_notice only' do
      earnings_and_benefits = described_class.new(agree_with_claimant_notice: true)

      expect(earnings_and_benefits.agree_with_claimant_notice).to be true
    end

    it 'with disagree claimant notice reason' do
      earnings_and_benefits = described_class.new(disagree_claimant_notice_reason: 'lorem ipsum notice')

      expect(earnings_and_benefits.disagree_claimant_notice_reason).to eql 'lorem ipsum notice'
    end

    it 'agree with claimant_pension_benefits only' do
      earnings_and_benefits = described_class.new(agree_with_claimant_pension_benefits: false)

      expect(earnings_and_benefits.agree_with_claimant_pension_benefits).to be false
    end

    it 'with disagree claimant_pension_benefits_reason' do
      earnings_and_benefits = described_class.new(disagree_claimant_pension_benefits_reason: 'lorem ipsum pension')

      expect(earnings_and_benefits.disagree_claimant_pension_benefits_reason).to eql 'lorem ipsum pension'
    end
  end

  describe ".to_h " do
    it "will take two strings and convert them into a hash" do
      earnings_and_benefits = described_class.new(agree_with_claimants_hours: true)

      expect(earnings_and_benefits.to_h).to be_a(Hash)
    end

    it 'will return the agree_with_claimants_hours key and value pair' do
      earnings_and_benefits = described_class.new(agree_with_claimants_hours: true)

      expect(earnings_and_benefits.to_h).to include(agree_with_claimants_hours: true)
    end

    it 'will return the queried_hours key and value pair' do
      earnings_and_benefits = described_class.new(queried_hours: 32)

      expect(earnings_and_benefits.to_h).to include(queried_hours: 32)
    end

    it 'will return the agree_with_earnings_details key and value pair' do
      earnings_and_benefits = described_class.new(agree_with_earnings_details: false)

      expect(earnings_and_benefits.to_h).to include(agree_with_earnings_details: false)
    end

    it 'will return the queried_pay_before_tax key and value pair' do
      earnings_and_benefits = described_class.new(queried_pay_before_tax: 1000)

      expect(earnings_and_benefits.to_h).to include(queried_pay_before_tax: 1000)
    end

    it 'will return the queried_pay_before_tax_period key and value pair' do
      earnings_and_benefits = described_class.new(queried_pay_before_tax_period: 'Monthly')

      expect(earnings_and_benefits.to_h).to include(queried_pay_before_tax_period: 'Monthly')
    end

    it 'will return the queried_take_home_pay key and value pair' do
      earnings_and_benefits = described_class.new(queried_take_home_pay: 900)

      expect(earnings_and_benefits.to_h).to include(queried_take_home_pay: 900)
    end

    it 'will return the queried_take_home_pay_period key and value pair' do
      earnings_and_benefits = described_class.new(queried_take_home_pay_period: 'Monthly')

      expect(earnings_and_benefits.to_h).to include(queried_take_home_pay_period: 'Monthly')
    end

    it 'will return the agree_with_claimant_notice key and value pair' do
      earnings_and_benefits = described_class.new(agree_with_claimant_notice: false)

      expect(earnings_and_benefits.to_h).to include(agree_with_claimant_notice: false)
    end

    it 'will return the disagree_claimant_notice_reason key and value pair' do
      earnings_and_benefits = described_class.new(disagree_claimant_notice_reason: 'lorem ipsum notice reason')

      expect(earnings_and_benefits.to_h).to include(disagree_claimant_notice_reason: 'lorem ipsum notice reason')
    end

    it 'will return the agree_with_claimant_pension_benefits key and value pair' do
      earnings_and_benefits = described_class.new(agree_with_claimant_pension_benefits: false)

      expect(earnings_and_benefits.to_h).to include(agree_with_claimant_pension_benefits: false)
    end

    it 'will return the disagree_claimant_pension_benefits_reason key and value pair' do
      earnings_and_benefits = described_class.new(disagree_claimant_pension_benefits_reason: 'lorem ipsum claimant pension reason')

      expect(earnings_and_benefits.to_h).to include(disagree_claimant_pension_benefits_reason: 'lorem ipsum claimant pension reason')
    end

  end
end
