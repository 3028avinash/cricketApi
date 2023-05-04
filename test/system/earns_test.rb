require "application_system_test_case"

class EarnsTest < ApplicationSystemTestCase
  setup do
    @earn = earns(:one)
  end

  test "visiting the index" do
    visit earns_url
    assert_selector "h1", text: "Earns"
  end

  test "should create earn" do
    visit earns_url
    click_on "New earn"

    fill_in "Account", with: @earn.account_id
    fill_in "Coin", with: @earn.coin
    fill_in "Logo", with: @earn.logo
    fill_in "Type", with: @earn.type
    click_on "Create Earn"

    assert_text "Earn was successfully created"
    click_on "Back"
  end

  test "should update Earn" do
    visit earn_url(@earn)
    click_on "Edit this earn", match: :first

    fill_in "Account", with: @earn.account_id
    fill_in "Coin", with: @earn.coin
    fill_in "Logo", with: @earn.logo
    fill_in "Type", with: @earn.type
    click_on "Update Earn"

    assert_text "Earn was successfully updated"
    click_on "Back"
  end

  test "should destroy Earn" do
    visit earn_url(@earn)
    click_on "Destroy this earn", match: :first

    assert_text "Earn was successfully destroyed"
  end
end
