require 'test_helper'

class Guest::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get guest_events_show_url
    assert_response :success
  end

  test "should get edit" do
    get guest_events_edit_url
    assert_response :success
  end

  test "should get new" do
    get guest_events_new_url
    assert_response :success
  end

  test "should get index" do
    get guest_events_index_url
    assert_response :success
  end

end
