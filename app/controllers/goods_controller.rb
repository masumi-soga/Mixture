class GoodsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_content = PostContent.find(params[:post_content_id])
    good = @post_content.goods.new(user_id: current_user.id)
    good.save
    @post_content.create_notification_by(current_user)
  end

  def destroy
    @post_content = PostContent.find(params[:post_content_id])
    good = @post_content.goods.find_by(user_id: current_user.id)
    good.destroy
  end

end
