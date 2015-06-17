class User < ActiveRecord::Base
  has_many :casts, dependent: :destroy
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  attr_accessor :avatar, :avatar_cache

  validates :email, :name, presence: true
  validates :name, length: { minimum: 3 }, uniqueness: true
  validates :default_zip, length: { minimum: 5 }
  validates :email, format: { with: /.+@.+\..+/, message: "must be an email address" }, uniqueness: true
  validates :password, confirmation: true
  validates :password, :password_confirmation, presence: { on: :create }
end
