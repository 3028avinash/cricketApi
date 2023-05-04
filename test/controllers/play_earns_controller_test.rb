require "test_helper"

class PlayEarnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @play_earn = play_earns(:one)
  end

  test "should get index" do
    get play_earns_url
    assert_response :success
  end

  test "should get new" do
    get new_play_earn_url
    assert_response :success
  end

  test "should create play_earn" do
    assert_difference("PlayEarn.count") do
      post play_earns_url, params: { play_earn: { blogImage: @play_earn.blogImage, blogUrl: @play_earn.blogUrl, title: @play_earn.title } }
    end

    assert_redirected_to play_earn_url(PlayEarn.last)
  end

  test "should show play_earn" do
    get play_earn_url(@play_earn)
    assert_response :success
  end

  test "should get edit" do
    get edit_play_earn_url(@play_earn)
    assert_response :success
  end

  test "should update play_earn" do
    patch play_earn_url(@play_earn), params: { play_earn: { blogImage: @play_earn.blogImage, blogUrl: @play_earn.blogUrl, title: @play_earn.title } }
    assert_redirected_to play_earn_url(@play_earn)
  end

  test "should destroy play_earn" do
    assert_difference("PlayEarn.count", -1) do
      delete play_earn_url(@play_earn)
    end

    assert_redirected_to play_earns_url
  end
end
