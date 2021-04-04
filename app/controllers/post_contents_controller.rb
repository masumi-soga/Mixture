class PostContentsController < ApplicationController

  def index
    @post_contents = PostContent.all
  end

end
