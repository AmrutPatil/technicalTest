require 'test_helper'

class WidgetsControllerTest < ActionDispatch::IntegrationTest
  test "should post create widget" do
    setup { ActiveSupport::TestCase.login }

    post widgets_create_path, params: { Name: 'a', Description: 'd', Type: 'hidden' }, xhr: true
    assert_response :success

    teardown { ActiveSupport::TestCase.logout }
  end

  test "should put update widget" do
    setup { ActiveSupport::TestCase.login }

    put '/widgets/update/1', params: { Name: 'a', Description: 'd' }, xhr: true
    assert_response :success

    teardown { ActiveSupport::TestCase.logout }
  end

  test "should delete widget" do
    setup { ActiveSupport::TestCase.login }

    delete '/widgets/delete/1', xhr: true
    assert_response :success

    teardown { ActiveSupport::TestCase.logout }
  end
end
