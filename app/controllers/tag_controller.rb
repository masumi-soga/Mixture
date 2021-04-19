class TagController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all.order(taggings_count: :desc)
  end
end
