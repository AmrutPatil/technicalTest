require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "should post login" do
    post authentication_login_path, params: { Email: 'email@some.com', Password: 'password' }, xhr: true
    assert_response :success
  end

  test "should post logout" do
    post authentication_logout_path, xhr: true
    assert_response :success
  end
end
