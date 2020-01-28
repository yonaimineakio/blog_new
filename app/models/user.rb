class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy


  validates :name, presence: true, length: {maximum: 50}
  before_save {email.downcase!}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},uniqueness: true,
  format: {with: VALID_EMAIL_REGEX}
  mount_uploader :image, ImageUploader

end
