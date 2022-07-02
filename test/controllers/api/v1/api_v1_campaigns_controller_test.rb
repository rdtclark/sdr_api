require "test_helper"
require 'pry'
class ApiV1CampaignsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get api_v1_campaigns_url
    assert_response :success
  end

  test "should limit results to max of 10 campaigns per request" do
    get api_v1_campaigns_url
    assert_operator assigns(:campaigns).count, :<=, 10
    assert_response :success
  end

end
