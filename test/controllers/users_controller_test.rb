require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  # called before every single test
  setup do
    @user = users(:one)
  end

  # called after every single test
  teardown do
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      # Reuse the @user instance variable from setup
      post users_url, params: { user: { name: @user.name } }
    end

    assert_redirected_to user_url(User.last)
    assert_equal 'User was successfully created.', flash[:notice]
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { name: @user.name } }
    assert_redirected_to user_url(@user)
    assert_equal 'User was successfully updated.', flash[:notice]
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
    assert_equal 'User was successfully destroyed.', flash[:notice]
  end
end
