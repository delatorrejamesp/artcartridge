class FollowsController < ApplicationController
  def create
    @user = User.friendly.find(params[:user_id])
    current_user.follow(@user)
  end

  def destroy
    @user = User.friendly.find(params[:user_id])
    current_user.stop_following(@user)
  end
end
