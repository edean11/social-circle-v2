class Cast < ActiveRecord::Base
  belongs_to :user
  has_many :castgroups, dependent: :destroy, inverse_of: :cast
  has_many :groups, through: :castgroups, inverse_of: :casts

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true
  validates :lat, presence: true
  validates :lon, presence: true
  default_scope -> { order(created_at: :desc) }
end
