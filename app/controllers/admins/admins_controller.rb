class Admins::AdminsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @post_contents = PostContent.all.page(params[:page]).per(10).order(created_at: :desc)
    @tags = ActsAsTaggableOn::Tag.all.order(taggings_count: :desc)
    @all_ranks = PostContent.find(Good.group(:post_content_id).order('count(post_content_id) desc').limit(5).pluck(:post_content_id))
    
    if params[:tag_name]
      @search_word = params[:tag_name]
      @post_contents = PostContent.tagged_with("#{params[:tag_name]}").page(params[:page]).per(10).order(created_at: :desc)
    end

    if params[:search]
      @search_word = params[:search]
      @post_contents = PostContent.all.search(params[:search]).page(params[:page]).per(10).order(created_at: :desc)
    end
    
  end
  
  def show
    @post_content = PostContent.find(params[:id])
    @post_contents = PostContent.all.order(created_at: :desc)
    @tags = ActsAsTaggableOn::Tag.all.order(taggings_count: :desc)
    @all_ranks = PostContent.find(Good.group(:post_content_id).order('count(post_content_id) desc').limit(5).pluck(:post_content_id))
    @comment = Comment.new
  end
  
  def user_show
    @user = User.find(params[:id])
    @post_contents = @user.post_contents.page(params[:page]).per(10).order(created_at: :desc)
  end
  
end
