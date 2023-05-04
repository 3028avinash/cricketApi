require "application_system_test_case"

class FantasiesTest < ApplicationSystemTestCase
  setup do
    @fantasy = fantasies(:one)
  end

  test "visiting the index" do
    visit fantasies_url
    assert_selector "h1", text: "Fantasies"
  end

  test "should create fantasy" do
    visit fantasies_url
    click_on "New fantasy"

    fill_in "Withdraw", with: @fantasy.Withdraw
    fill_in "Link", with: @fantasy.link
    fill_in "Logo", with: @fantasy.logo
    fill_in "Refrelcode", with: @fantasy.refrelCode
    fill_in "Signupbonus", with: @fantasy.signUpBonus
    fill_in "Title", with: @fantasy.title
    fill_in "Withdrawtype", with: @fantasy.withdrawType
    click_on "Create Fantasy"

    assert_text "Fantasy was successfully created"
    click_on "Back"
  end

  test "should update Fantasy" do
    visit fantasy_url(@fantasy)
    click_on "Edit this fantasy", match: :first

    fill_in "Withdraw", with: @fantasy.Withdraw
    fill_in "Link", with: @fantasy.link
    fill_in "Logo", with: @fantasy.logo
    fill_in "Refrelcode", with: @fantasy.refrelCode
    fill_in "Signupbonus", with: @fantasy.signUpBonus
    fill_in "Title", with: @fantasy.title
    fill_in "Withdrawtype", with: @fantasy.withdrawType
    click_on "Update Fantasy"

    assert_text "Fantasy was successfully updated"
    click_on "Back"
  end

  test "should destroy Fantasy" do
    visit fantasy_url(@fantasy)
    click_on "Destroy this fantasy", match: :first

    assert_text "Fantasy was successfully destroyed"
  end
end
