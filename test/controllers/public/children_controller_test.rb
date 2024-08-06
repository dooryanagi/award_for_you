require "test_helper"

class Public::ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_children_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_children_edit_url
    assert_response :success
  end

  test "should get new_album" do
    get public_children_new_album_url
    assert_response :success
  end

  test "should get show_album" do
    get public_children_show_album_url
    assert_response :success
  end
end
