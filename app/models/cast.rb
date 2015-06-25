class Cast < ActiveRecord::Base
  belongs_to :user
  has_many :castgroups, dependent: :destroy, inverse_of: :cast
  has_many :groups, through: :castgroups, inverse_of: :casts
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 120 }
  validates :time_offset, presence: true
  validates :lat, presence: true
  validates :lon, presence: true
  default_scope -> { order(created_at: :desc) }

end
