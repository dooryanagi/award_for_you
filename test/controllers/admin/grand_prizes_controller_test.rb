require "test_helper"

class Admin::GrandPrizesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_grand_prizes_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_grand_prizes_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_grand_prizes_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_grand_prizes_edit_url
    assert_response :success
  end
end
