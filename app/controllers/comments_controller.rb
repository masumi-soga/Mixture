class CommentsController < ApplicationController

  def create
    @post_content = PostContent.find(params[:post_content_id])
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_content_id = @post_content.id
    binding.pry
    if @comment.save
      redirect_to post_content_path(@post_content)
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :file)
  end

end
