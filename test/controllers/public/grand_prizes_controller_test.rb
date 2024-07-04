require "test_helper"

class Public::GrandPrizesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_grand_prizes_new_url
    assert_response :success
  end

  test "should get index" do
    get public_grand_prizes_index_url
    assert_response :success
  end

  test "should get show" do
    get public_grand_prizes_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_grand_prizes_edit_url
    assert_response :success
  end
end
