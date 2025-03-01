class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @borrowings = @user.borrowings.where(returned_at: nil)
  end

  def profile
    @user = User.find(params[:user_id])
    @borrowings = @user.borrowings
  end
end
