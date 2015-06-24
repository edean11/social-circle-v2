class User < ActiveRecord::Base
  has_many :casts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy, inverse_of: :user
  has_many :groups, through: :subscriptions, inverse_of: :users
  has_many :comments, dependent: :destroy
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

  validates :email, :name, presence: true
  validates :name, length: { minimum: 3 }, uniqueness: true
  validates :email, format: { with: /.+@.+\..+/, message: "must be an email address" }, uniqueness: true
  validates :password, confirmation: true
  validates :password, :password_confirmation, presence: { on: :create }

end
