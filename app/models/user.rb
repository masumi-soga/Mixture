class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :post_contents, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  attachment :profile_image
end
