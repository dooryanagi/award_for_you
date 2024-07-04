require "test_helper"

class Public::WaitingEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_waiting_events_new_url
    assert_response :success
  end
end
