require "application_system_test_case"

class AppOpensTest < ApplicationSystemTestCase
  setup do
    @app_open = app_opens(:one)
  end

  test "visiting the index" do
    visit app_opens_url
    assert_selector "h1", text: "App opens"
  end

  test "should create app open" do
    visit app_opens_url
    click_on "New app open"

    fill_in "Location", with: @app_open.location
    fill_in "Source ip", with: @app_open.source_ip
    fill_in "User", with: @app_open.user_id
    fill_in "Versioncode", with: @app_open.versionCode
    fill_in "Versionname", with: @app_open.versionName
    click_on "Create App open"

    assert_text "App open was successfully created"
    click_on "Back"
  end

  test "should update App open" do
    visit app_open_url(@app_open)
    click_on "Edit this app open", match: :first

    fill_in "Location", with: @app_open.location
    fill_in "Source ip", with: @app_open.source_ip
    fill_in "User", with: @app_open.user_id
    fill_in "Versioncode", with: @app_open.versionCode
    fill_in "Versionname", with: @app_open.versionName
    click_on "Update App open"

    assert_text "App open was successfully updated"
    click_on "Back"
  end

  test "should destroy App open" do
    visit app_open_url(@app_open)
    click_on "Destroy this app open", match: :first

    assert_text "App open was successfully destroyed"
  end
end
