require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get get_widgets" do
    get dashboard_get_widgets_url
    assert_response :success
  end

  test "should get get_widgets with search term" do
    get dashboard_get_widgets_url, params: { term: 'a' }, xhr: true
    assert_response :success
  end

  test "should get get_widgets for logged in user" do
    setup { ActiveSupport::TestCase.login }

    get dashboard_get_widgets_url, params: { my_widgets: true }
    assert_response :success

    teardown { ActiveSupport::TestCase.logout }
  end

  test "should get get_widgets for other user" do
    setup { ActiveSupport::TestCase.login }

    get dashboard_get_widgets_url, params: { user_id: 1 }
    assert_response :success

    teardown { ActiveSupport::TestCase.logout }
  end
end
