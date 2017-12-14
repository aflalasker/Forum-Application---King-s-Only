require "test_helper"

class LoginFlowTest < ActionDispatch::IntegrationTest
  test "cannot logout if logged in" do
    get '/'
    assert_response :success
    
    session[:id] = 1
    get '/'
    assert_not page.has_button?("Logout")
  end
end
