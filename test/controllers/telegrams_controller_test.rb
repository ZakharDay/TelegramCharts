require "test_helper"

class TelegramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telegram = telegrams(:one)
  end

  test "should get index" do
    get telegrams_url
    assert_response :success
  end

  test "should get new" do
    get new_telegram_url
    assert_response :success
  end

  test "should create telegram" do
    assert_difference("Telegram.count") do
      post telegrams_url, params: { telegram: { avatar: @telegram.avatar, cover: @telegram.cover, description: @telegram.description, name: @telegram.name, url: @telegram.url } }
    end

    assert_redirected_to telegram_url(Telegram.last)
  end

  test "should show telegram" do
    get telegram_url(@telegram)
    assert_response :success
  end

  test "should get edit" do
    get edit_telegram_url(@telegram)
    assert_response :success
  end

  test "should update telegram" do
    patch telegram_url(@telegram), params: { telegram: { avatar: @telegram.avatar, cover: @telegram.cover, description: @telegram.description, name: @telegram.name, url: @telegram.url } }
    assert_redirected_to telegram_url(@telegram)
  end

  test "should destroy telegram" do
    assert_difference("Telegram.count", -1) do
      delete telegram_url(@telegram)
    end

    assert_redirected_to telegrams_url
  end
end
