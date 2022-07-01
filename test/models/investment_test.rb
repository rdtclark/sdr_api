require "test_helper"

class InvestmentTest < ActiveSupport::TestCase

  def setup
    @campaign = Campaign.create!(
      name: 'C2H20',
      image: 'https://c2h20.com',
      target_amount: 500000,
      sector: 'Science',
      country: 'UK',
      investment_multiplier: 500
    )
    @investment = Investment.create!(campaign: @campaign, total_multiples_invested: 20)
  end

  test "should create investment with valid data" do
    assert @investment.valid?
  end

  test "total multiples invested should be a whole number" do
    @investment.total_multiples_invested = 'five'
    assert_not @investment.valid?
  end

end
