require "application_system_test_case"

class UserProfilesTest < ApplicationSystemTestCase
  setup do
    @user_profile = user_profiles(:one)
  end

  test "visiting the index" do
    visit user_profiles_url
    assert_selector "h1", text: "User profiles"
  end

  test "should create user profile" do
    visit user_profiles_url
    click_on "New user profile"

    fill_in "Birthdate", with: @user_profile.birthDate
    fill_in "Email", with: @user_profile.email
    fill_in "Gender", with: @user_profile.gender
    fill_in "Location", with: @user_profile.location
    fill_in "Mobile", with: @user_profile.mobile
    fill_in "Name", with: @user_profile.name
    fill_in "Occupation", with: @user_profile.occupation
    fill_in "Profile pic", with: @user_profile.profile_pic
    fill_in "Source ip", with: @user_profile.source_ip
    fill_in "User", with: @user_profile.user_id
    click_on "Create User profile"

    assert_text "User profile was successfully created"
    click_on "Back"
  end

  test "should update User profile" do
    visit user_profile_url(@user_profile)
    click_on "Edit this user profile", match: :first

    fill_in "Birthdate", with: @user_profile.birthDate
    fill_in "Email", with: @user_profile.email
    fill_in "Gender", with: @user_profile.gender
    fill_in "Location", with: @user_profile.location
    fill_in "Mobile", with: @user_profile.mobile
    fill_in "Name", with: @user_profile.name
    fill_in "Occupation", with: @user_profile.occupation
    fill_in "Profile pic", with: @user_profile.profile_pic
    fill_in "Source ip", with: @user_profile.source_ip
    fill_in "User", with: @user_profile.user_id
    click_on "Update User profile"

    assert_text "User profile was successfully updated"
    click_on "Back"
  end

  test "should destroy User profile" do
    visit user_profile_url(@user_profile)
    click_on "Destroy this user profile", match: :first

    assert_text "User profile was successfully destroyed"
  end
end
