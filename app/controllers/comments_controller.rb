class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @post_content = PostContent.find(params[:post_content_id])
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_content_id = @post_content.id
    @comment_post_content = @comment.post_content
    if @comment.save
      @comment_post_content.create_notification_comment!(current_user, @comment.id)
      redirect_to post_content_path(@post_content)
    else
      @post_content = PostContent.find(params[:post_content_id])
      @tags = ActsAsTaggableOn::Tag.all.order(taggings_count: :desc)
      @all_ranks = PostContent.find(Good.group(:post_content_id).order('count(post_content_id) desc').limit(5).pluck(:post_content_id))

      render 'post_contents/show'
    end
  end

  def destroy
		Comment.find_by(id: params[:id], post_content_id: params[:post_content_id]).destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :file)
  end

end
