require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    setup { ActiveSupport::TestCase.login }

    get '/users/user/1', xhr: true
    assert_response :success

    teardown { ActiveSupport::TestCase.logout }
  end

  test "should post create user" do
    post users_create_path, params: { FirstName: 'a', LastName: 'b', Email: 'a@some.com', Password: 'pwd' }, xhr: true
    assert_response :success
  end

  test "should put update user" do
    setup { ActiveSupport::TestCase.login }

    put users_update_path, params: { FirstName: 'a', LastName: 'b', Email: 'a@some.com', Password: 'pwd' }, xhr: true
    assert_response :success

    teardown { ActiveSupport::TestCase.logout }
  end

  test "should post reset password" do
    post users_reset_password_path, params: { resetPasswordEmail: 'a@some.com' }, xhr: true
    assert_response :success
  end

  test "should post change password" do
    setup { ActiveSupport::TestCase.login }

    post users_change_password_path, params: { OldPassword: 'password', NewPassword: 'pwd' }, xhr: true
    assert_response :success

    teardown { ActiveSupport::TestCase.logout }
  end
end
