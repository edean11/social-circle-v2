class Group < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  default_scope -> { order(created_at: :desc) }
end
