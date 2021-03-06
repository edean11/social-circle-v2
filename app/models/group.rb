class Group < ActiveRecord::Base
  has_many :subscriptions, dependent: :destroy, inverse_of: :group
  has_many :users, through: :subscriptions, inverse_of: :groups
  has_many :castgroups, dependent: :destroy, inverse_of: :group
  has_many :casts, through: :castgroups, inverse_of: :groups
  validates :name, presence: true, length: { maximum: 80 }, uniqueness: true
  default_scope -> { order(created_at: :desc) }

  mount_uploader :picture, AvatarUploader

  def self.unsubscribed_groups(id)
    groups = Group.joins(:subscriptions)
    output = groups.where.not(subscriptions: { user_id: id })
    return output
  end
end
