require "application_system_test_case"

class WithdrawsTest < ApplicationSystemTestCase
  setup do
    @withdraw = withdraws(:one)
  end

  test "visiting the index" do
    visit withdraws_url
    assert_selector "h1", text: "Withdraws"
  end

  test "should create withdraw" do
    visit withdraws_url
    click_on "New withdraw"

    fill_in "Account", with: @withdraw.account_id
    fill_in "Coin", with: @withdraw.coin
    fill_in "Coin amount", with: @withdraw.coin_amount
    fill_in "Txn in", with: @withdraw.txn_in
    click_on "Create Withdraw"

    assert_text "Withdraw was successfully created"
    click_on "Back"
  end

  test "should update Withdraw" do
    visit withdraw_url(@withdraw)
    click_on "Edit this withdraw", match: :first

    fill_in "Account", with: @withdraw.account_id
    fill_in "Coin", with: @withdraw.coin
    fill_in "Coin amount", with: @withdraw.coin_amount
    fill_in "Txn in", with: @withdraw.txn_in
    click_on "Update Withdraw"

    assert_text "Withdraw was successfully updated"
    click_on "Back"
  end

  test "should destroy Withdraw" do
    visit withdraw_url(@withdraw)
    click_on "Destroy this withdraw", match: :first

    assert_text "Withdraw was successfully destroyed"
  end
end
