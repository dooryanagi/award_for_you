require "test_helper"

class Public::AwardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_awards_new_url
    assert_response :success
  end

  test "should get index" do
    get public_awards_index_url
    assert_response :success
  end

  test "should get show" do
    get public_awards_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_awards_edit_url
    assert_response :success
  end
end
