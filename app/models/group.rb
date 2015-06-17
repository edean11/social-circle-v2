class Group < ActiveRecord::Base
  has_many :users
  validates :name, presence: true, length: { maximum: 30 }
  default_scope -> { order(created_at: :desc) }
end
