require "test_helper"

class AppOpensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_open = app_opens(:one)
  end

  test "should get index" do
    get app_opens_url
    assert_response :success
  end

  test "should get new" do
    get new_app_open_url
    assert_response :success
  end

  test "should create app_open" do
    assert_difference("AppOpen.count") do
      post app_opens_url, params: { app_open: { location: @app_open.location, source_ip: @app_open.source_ip, user_id: @app_open.user_id, versionCode: @app_open.versionCode, versionName: @app_open.versionName } }
    end

    assert_redirected_to app_open_url(AppOpen.last)
  end

  test "should show app_open" do
    get app_open_url(@app_open)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_open_url(@app_open)
    assert_response :success
  end

  test "should update app_open" do
    patch app_open_url(@app_open), params: { app_open: { location: @app_open.location, source_ip: @app_open.source_ip, user_id: @app_open.user_id, versionCode: @app_open.versionCode, versionName: @app_open.versionName } }
    assert_redirected_to app_open_url(@app_open)
  end

  test "should destroy app_open" do
    assert_difference("AppOpen.count", -1) do
      delete app_open_url(@app_open)
    end

    assert_redirected_to app_opens_url
  end
end
