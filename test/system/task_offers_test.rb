require "application_system_test_case"

class TaskOffersTest < ApplicationSystemTestCase
  setup do
    @task_offer = task_offers(:one)
  end

  test "visiting the index" do
    visit task_offers_url
    assert_selector "h1", text: "Task offers"
  end

  test "should create task offer" do
    visit task_offers_url
    click_on "New task offer"

    fill_in "Point", with: @task_offer.point
    fill_in "Reward", with: @task_offer.reward
    fill_in "Task", with: @task_offer.task
    fill_in "Title", with: @task_offer.title
    fill_in "Titleimg", with: @task_offer.titleImg
    click_on "Create Task offer"

    assert_text "Task offer was successfully created"
    click_on "Back"
  end

  test "should update Task offer" do
    visit task_offer_url(@task_offer)
    click_on "Edit this task offer", match: :first

    fill_in "Point", with: @task_offer.point
    fill_in "Reward", with: @task_offer.reward
    fill_in "Task", with: @task_offer.task
    fill_in "Title", with: @task_offer.title
    fill_in "Titleimg", with: @task_offer.titleImg
    click_on "Update Task offer"

    assert_text "Task offer was successfully updated"
    click_on "Back"
  end

  test "should destroy Task offer" do
    visit task_offer_url(@task_offer)
    click_on "Destroy this task offer", match: :first

    assert_text "Task offer was successfully destroyed"
  end
end
