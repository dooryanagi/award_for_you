require "test_helper"

class Admin::AwardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_awards_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_awards_show_url
    assert_response :success
  end
end
