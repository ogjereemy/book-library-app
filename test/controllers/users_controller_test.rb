require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # Add this if it’s missing
      format.json { render json: @user }
    end
  end

  def setup
    @user = users(:one) # Fixture for user
    sign_in @user
  end

  test "should get show" do
    get user_path(@user), as: :json
    assert_response :success
  end

  test "should display user borrowings" do
    get user_profile_path(user_id: @user.id)
    assert_equal @user, assigns(:user)
    assert_not_nil assigns(:borrowings)
  end
end
