require "test_helper"

class InnsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inns_index_url
    assert_response :success
  end

  test "should get show" do
    get inns_show_url
    assert_response :success
  end

  test "should get new" do
    get inns_new_url
    assert_response :success
  end

  test "should get edit" do
    get inns_edit_url
    assert_response :success
  end
end
