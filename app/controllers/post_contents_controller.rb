class PostContentsController < ApplicationController

  before_action :authenticate!

  def authenticate!
    if admin_signed_in?
      authenticate_admin!
    else
      authenticate_user!
    end
  end

  def index
    @post_contents = PostContent.all.page(params[:page]).per(10).order(created_at: :desc)
    @tags = ActsAsTaggableOn::Tag.all.order(taggings_count: :desc)
    @all_ranks = PostContent.find(Good.group(:post_content_id).order('count(post_content_id) desc').limit(5).pluck(:post_content_id))
    @comment_ranks = PostContent.find(Comment.group(:post_content_id).order('count(post_content_id) desc').limit(5).pluck(:post_content_id))
    @user = current_user

    # タグ絞り込み
    if params[:tag_name]
      @search_word = params[:tag_name]
      @post_contents = PostContent.tagged_with("#{params[:tag_name]}").page(params[:page]).per(10).order(created_at: :desc)
    end

    # タイトル検索時
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
    @comment_ranks = PostContent.find(Comment.group(:post_content_id).order('count(post_content_id) desc').limit(5).pluck(:post_content_id))
    @comment = Comment.new

  end

  def new
    @post_content = PostContent.new
  end

  def create
    @post_content = PostContent.new(post_content_params)
    @post_content.user_id = current_user.id
    if @post_content.save
      redirect_to post_contents_path
    else
      render 'new'
    end
  end

  def edit
    @post_content = PostContent.find(params[:id])
  end

  def update
    @post_content = PostContent.find(params[:id])
    if @post_content.update(post_content_params)
      redirect_to post_contents_path
    else
      render 'edit'
    end
  end

  def destroy
    @post_content = PostContent.find(params[:id])
    @post_content.destroy
    if admin_signed_in?
      redirect_to admins_path
    else
      redirect_to post_contents_path
    end
  end


  private

  def post_content_params
    params.require(:post_content).permit(:title, :text, :file, :tag_list)
  end

end
