class TagController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @tags = ActsAsTaggableOn::Tag.all.order(taggings_count: :desc)
  end
end
