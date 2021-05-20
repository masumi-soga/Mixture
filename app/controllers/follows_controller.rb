class FollowsController < ApplicationController

  before_action :authenticate_user!

  def create
    current_user.follow(params[:user_id])
    @user = User.find(params[:user_id])
    @user.create_notification_follow!(current_user)
    flash[:notice] = "フォローしました"
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    flash[:notice] = "フォローを外しました"
    redirect_to request.referer
  end

  # フォローしているユーザ
  def followings
		user = User.find(params[:user_id])
		@users = user.followings
  end

  # フォローされているユーザ
  def followers
		user = User.find(params[:user_id])
		@users = user.followers
  end

end
