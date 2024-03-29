class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_secure_password
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: {maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  validates :password, length: { minimum: 6 }
  has_many :pictures
  has_many :favorites, dependent: :destroy
end
