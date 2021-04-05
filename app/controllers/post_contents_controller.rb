class PostContentsController < ApplicationController

  def index
    @post_contents = PostContent.all
  end

  def new
    @post_content = PostContent.new
  end

  def create
    @post_content = PostContent.new(post_content_params)
    @post_content.user_id = current_user.id
    @post_content.save!
    redirect_to post_contents_path
  end

  private

  def post_content_params
    params.require(:post_content).permit(:title, :text, :file, :tag)
  end

end
