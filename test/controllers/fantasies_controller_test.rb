require "test_helper"

class FantasiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fantasy = fantasies(:one)
  end

  test "should get index" do
    get fantasies_url
    assert_response :success
  end

  test "should get new" do
    get new_fantasy_url
    assert_response :success
  end

  test "should create fantasy" do
    assert_difference("Fantasy.count") do
      post fantasies_url, params: { fantasy: { Withdraw: @fantasy.Withdraw, link: @fantasy.link, logo: @fantasy.logo, refrelCode: @fantasy.refrelCode, signUpBonus: @fantasy.signUpBonus, title: @fantasy.title, withdrawType: @fantasy.withdrawType } }
    end

    assert_redirected_to fantasy_url(Fantasy.last)
  end

  test "should show fantasy" do
    get fantasy_url(@fantasy)
    assert_response :success
  end

  test "should get edit" do
    get edit_fantasy_url(@fantasy)
    assert_response :success
  end

  test "should update fantasy" do
    patch fantasy_url(@fantasy), params: { fantasy: { Withdraw: @fantasy.Withdraw, link: @fantasy.link, logo: @fantasy.logo, refrelCode: @fantasy.refrelCode, signUpBonus: @fantasy.signUpBonus, title: @fantasy.title, withdrawType: @fantasy.withdrawType } }
    assert_redirected_to fantasy_url(@fantasy)
  end

  test "should destroy fantasy" do
    assert_difference("Fantasy.count", -1) do
      delete fantasy_url(@fantasy)
    end

    assert_redirected_to fantasies_url
  end
end
