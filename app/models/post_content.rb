class PostContent < ApplicationRecord
  mount_uploader :file, AudiofileUploader

  belongs_to :user

end
