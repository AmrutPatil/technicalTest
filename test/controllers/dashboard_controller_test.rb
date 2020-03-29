require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get GetWidgets" do
    get dashboard_GetWidgets_url
    assert_response :success
  end

end
