require 'test_helper'

class Guest::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get guest_members_show_url
    assert_response :success
  end

end
