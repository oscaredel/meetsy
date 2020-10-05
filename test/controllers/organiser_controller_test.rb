require 'test_helper'

class OrganiserControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get organiser_create_url
    assert_response :success
  end

  test "should get update" do
    get organiser_update_url
    assert_response :success
  end

  test "should get destroy" do
    get organiser_destroy_url
    assert_response :success
  end

end
