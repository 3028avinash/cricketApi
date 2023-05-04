require "application_system_test_case"

class TeamsTest < ApplicationSystemTestCase
  setup do
    @team = teams(:one)
  end

  test "visiting the index" do
    visit teams_url
    assert_selector "h1", text: "Teams"
  end

  test "should create team" do
    visit teams_url
    click_on "New team"

    fill_in "Countrycode", with: @team.countryCode
    fill_in "Countryname", with: @team.countryName
    fill_in "Matchstatus", with: @team.matchStatus
    fill_in "Teamlogo", with: @team.teamLogo
    fill_in "Views", with: @team.views
    click_on "Create Team"

    assert_text "Team was successfully created"
    click_on "Back"
  end

  test "should update Team" do
    visit team_url(@team)
    click_on "Edit this team", match: :first

    fill_in "Countrycode", with: @team.countryCode
    fill_in "Countryname", with: @team.countryName
    fill_in "Matchstatus", with: @team.matchStatus
    fill_in "Teamlogo", with: @team.teamLogo
    fill_in "Views", with: @team.views
    click_on "Update Team"

    assert_text "Team was successfully updated"
    click_on "Back"
  end

  test "should destroy Team" do
    visit team_url(@team)
    click_on "Destroy this team", match: :first

    assert_text "Team was successfully destroyed"
  end
end
