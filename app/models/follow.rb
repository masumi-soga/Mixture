class Follow < ApplicationRecord

  # フォローする人
  belongs_to :follower, class_name: "User"
  # フォローされる人
  belongs_to :followed, class_name: "User"

  def followings
     user = User.find(params[:user_id])
     @users = user.followings
  end

  def followers
     user = User.find(params[:user_id])
     @users = user.followers
  end

end
