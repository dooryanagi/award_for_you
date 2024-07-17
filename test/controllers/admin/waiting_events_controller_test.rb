require "test_helper"

class Admin::WaitingEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_waiting_events_index_url
    assert_response :success
  end
end
