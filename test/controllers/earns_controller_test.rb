require "test_helper"

class EarnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @earn = earns(:one)
  end

  test "should get index" do
    get earns_url
    assert_response :success
  end

  test "should get new" do
    get new_earn_url
    assert_response :success
  end

  test "should create earn" do
    assert_difference("Earn.count") do
      post earns_url, params: { earn: { account_id: @earn.account_id, coin: @earn.coin, logo: @earn.logo, type: @earn.type } }
    end

    assert_redirected_to earn_url(Earn.last)
  end

  test "should show earn" do
    get earn_url(@earn)
    assert_response :success
  end

  test "should get edit" do
    get edit_earn_url(@earn)
    assert_response :success
  end

  test "should update earn" do
    patch earn_url(@earn), params: { earn: { account_id: @earn.account_id, coin: @earn.coin, logo: @earn.logo, type: @earn.type } }
    assert_redirected_to earn_url(@earn)
  end

  test "should destroy earn" do
    assert_difference("Earn.count", -1) do
      delete earn_url(@earn)
    end

    assert_redirected_to earns_url
  end
end
