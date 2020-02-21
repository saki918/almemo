require 'test_helper'

class Admin::GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_guests_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_guests_edit_url
    assert_response :success
  end

  test "should get index" do
    get admin_guests_index_url
    assert_response :success
  end

end
