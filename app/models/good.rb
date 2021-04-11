class Good < ApplicationRecord
  
  belongs_to :user
  belongs_to :post_content
  validates_uniqueness_of :post_content_id, scope: :user_id
  
end
