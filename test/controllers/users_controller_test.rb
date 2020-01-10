require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should get create" do
    get new_user_url
    assert_response :success
  end

  test "should get redirected with no user" do
    get signin_url
    assert_response :success
  end

end
