require 'test_helper'

class Guest::EventmembersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get guest_eventmembers_edit_url
    assert_response :success
  end

end
