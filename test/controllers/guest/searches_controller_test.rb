require 'test_helper'

class Guest::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guest_searches_index_url
    assert_response :success
  end

end
