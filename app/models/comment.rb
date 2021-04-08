class Comment < ApplicationRecord
  mount_uploader :file, AudiofileUploader
  
  belongs_to :user
  belongs_to :post_content
  
end
