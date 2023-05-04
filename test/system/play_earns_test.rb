require "application_system_test_case"

class PlayEarnsTest < ApplicationSystemTestCase
  setup do
    @play_earn = play_earns(:one)
  end

  test "visiting the index" do
    visit play_earns_url
    assert_selector "h1", text: "Play earns"
  end

  test "should create play earn" do
    visit play_earns_url
    click_on "New play earn"

    fill_in "Blogimage", with: @play_earn.blogImage
    fill_in "Blogurl", with: @play_earn.blogUrl
    fill_in "Title", with: @play_earn.title
    click_on "Create Play earn"

    assert_text "Play earn was successfully created"
    click_on "Back"
  end

  test "should update Play earn" do
    visit play_earn_url(@play_earn)
    click_on "Edit this play earn", match: :first

    fill_in "Blogimage", with: @play_earn.blogImage
    fill_in "Blogurl", with: @play_earn.blogUrl
    fill_in "Title", with: @play_earn.title
    click_on "Update Play earn"

    assert_text "Play earn was successfully updated"
    click_on "Back"
  end

  test "should destroy Play earn" do
    visit play_earn_url(@play_earn)
    click_on "Destroy this play earn", match: :first

    assert_text "Play earn was successfully destroyed"
  end
end
