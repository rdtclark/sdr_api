require "test_helper"

class CampaignTest < ActiveSupport::TestCase
  def setup 
    @campaign_1 = Campaign.create!(
      name: 'C2H20',
      image: 'https://google.com',
      target_amount: 500000,
      sector: 'Science',
      country: 'UK',
      investment_multiplier: 500
    )
    @campaign_2 = Campaign.create!(
      name: 'Fat Free Doughnuts Direct',
      image: 'https://ffdd.com',
      target_amount: 200000,
      sector: 'Food',
      country: 'UK',
      investment_multiplier: 247
    )
    @investment_1 = Investment.create!(campaign: @campaign_1, total_multiples_invested: 100)
  end

  test "campaign should be valid" do
    assert @campaign_1.valid?
  end

  test "campaign can have many investments" do
    @investment_2 = Investment.create!(campaign: @campaign_2, total_multiples_invested: 50)
    @investment_3 = Investment.create!(campaign: @campaign_2, total_multiples_invested: 150)
    assert_equal 2, @campaign_2.investments.count
  end

  test "perecentage raised should be correct" do
    assert_equal 10.00, @campaign_1.percentage_raised
  end

  test "percentage raised should update upon new investment" do
    # assert pecentage updated after
  end

  test "should get paginated index" do
    # get campaigns_url
    # assert_response :success
  end
end
