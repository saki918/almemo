require 'test_helper'

class Guest::GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get guest_guests_show_url
    assert_response :success
  end

  test "should get edit" do
    get guest_guests_edit_url
    assert_response :success
  end

end
