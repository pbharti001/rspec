require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Welcome#index"
  end

  test "can create a user" do
    get "/users/new"
    assert_response :success

    post "/users",
      params: { user: { name: "lucifer" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Name:\n  lucifer"   #There must be 2 whitespaces b/w 'Name:\n' & 'lucifer'.
  end
end
