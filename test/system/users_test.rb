require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "Advertisingid", with: @user.advertisingId
    fill_in "Deviceid", with: @user.deviceId
    fill_in "Devicename", with: @user.deviceName
    fill_in "Devicetype", with: @user.deviceType
    fill_in "Socialemail", with: @user.socialEmail
    fill_in "Socialid", with: @user.socialId
    fill_in "Socialname", with: @user.socialName
    fill_in "Socialtoken", with: @user.socialToken
    fill_in "Socialtype", with: @user.socialType
    fill_in "Socialmgurl", with: @user.socialmgUrl
    fill_in "Utmcampaign", with: @user.utmCampaign
    fill_in "Utmcontent", with: @user.utmContent
    fill_in "Utmmedium", with: @user.utmMedium
    fill_in "Utmsource", with: @user.utmSource
    fill_in "Utmterm", with: @user.utmTerm
    fill_in "Versioncode", with: @user.versionCode
    fill_in "Versionname", with: @user.versionName
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "Advertisingid", with: @user.advertisingId
    fill_in "Deviceid", with: @user.deviceId
    fill_in "Devicename", with: @user.deviceName
    fill_in "Devicetype", with: @user.deviceType
    fill_in "Socialemail", with: @user.socialEmail
    fill_in "Socialid", with: @user.socialId
    fill_in "Socialname", with: @user.socialName
    fill_in "Socialtoken", with: @user.socialToken
    fill_in "Socialtype", with: @user.socialType
    fill_in "Socialmgurl", with: @user.socialmgUrl
    fill_in "Utmcampaign", with: @user.utmCampaign
    fill_in "Utmcontent", with: @user.utmContent
    fill_in "Utmmedium", with: @user.utmMedium
    fill_in "Utmsource", with: @user.utmSource
    fill_in "Utmterm", with: @user.utmTerm
    fill_in "Versioncode", with: @user.versionCode
    fill_in "Versionname", with: @user.versionName
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
