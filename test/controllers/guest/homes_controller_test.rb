require 'test_helper'

class Guest::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get guest_homes_top_url
    assert_response :success
  end

end
