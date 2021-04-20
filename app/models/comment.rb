class Comment < ApplicationRecord
  mount_uploader :file, AudiofileUploader

  belongs_to :user
  belongs_to :post_content

  validates :comment, presence: true, length: {maximum: 250}

end
