require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get profile" do
    get user_profile_url(@user)
    assert_response :success
  end
end
