require "test_helper"

class TaskOffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_offer = task_offers(:one)
  end

  test "should get index" do
    get task_offers_url
    assert_response :success
  end

  test "should get new" do
    get new_task_offer_url
    assert_response :success
  end

  test "should create task_offer" do
    assert_difference("TaskOffer.count") do
      post task_offers_url, params: { task_offer: { point: @task_offer.point, reward: @task_offer.reward, task: @task_offer.task, title: @task_offer.title, titleImg: @task_offer.titleImg } }
    end

    assert_redirected_to task_offer_url(TaskOffer.last)
  end

  test "should show task_offer" do
    get task_offer_url(@task_offer)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_offer_url(@task_offer)
    assert_response :success
  end

  test "should update task_offer" do
    patch task_offer_url(@task_offer), params: { task_offer: { point: @task_offer.point, reward: @task_offer.reward, task: @task_offer.task, title: @task_offer.title, titleImg: @task_offer.titleImg } }
    assert_redirected_to task_offer_url(@task_offer)
  end

  test "should destroy task_offer" do
    assert_difference("TaskOffer.count", -1) do
      delete task_offer_url(@task_offer)
    end

    assert_redirected_to task_offers_url
  end
end
