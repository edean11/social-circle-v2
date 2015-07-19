class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :casts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy, inverse_of: :user
  has_many :groups, through: :subscriptions, inverse_of: :users
  has_many :comments, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validates :email, :name, presence: true
  validates :name, length: { minimum: 3 }, uniqueness: true
  validates :email, format: { with: /.+@.+\..+/, message: "must be an email address" }, uniqueness: true
  validates :password, confirmation: true, length: {minimum: 5, maximum: 120}, presence: { on: :create }

  before_save :ensure_authentication_token

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

end
