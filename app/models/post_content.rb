class PostContent < ApplicationRecord
  mount_uploader :file, AudiofileUploader

  has_many :goods
  has_many :comments
  belongs_to :user

  def gooded_by?(user)
		goods.where(user_id: user.id).exists?
  end

end
