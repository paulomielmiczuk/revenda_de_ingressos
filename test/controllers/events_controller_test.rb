require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get events_edit_url
    assert_response :success
  end

  test "should get update" do
    get events_update_url
    assert_response :success
  end
end
