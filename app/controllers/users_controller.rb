class UsersController < ApplicationController

before_action :authenticate!

  def authenticate!
    if admin_signed_in?
      authenticate_admin!
    else
      authenticate_user!
    end
  end

  def show
    @user = User.find(params[:id])
    @post_contents = @user.post_contents.page(params[:post_contents_page]).per(10).order(created_at: :desc)
      #current_userの投稿に紐づいた通知一覧
    @notifications = current_user.passive_notifications.page(params[:notifications_page]).per(10)
    #@notificationの中でまだ確認していない(indexに一度も遷移していない)通知のみ
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "更新しました"
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
