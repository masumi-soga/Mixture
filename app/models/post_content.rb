class PostContent < ApplicationRecord
  mount_uploader :file, AudiofileUploader
  acts_as_taggable
  
  has_many :goods, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  def gooded_by?(user)
		goods.where(user_id: user.id).exists?
  end

end
