class Comment < ActiveRecord::Base
  belongs_to :cast, inverse_of: :comments
  belongs_to :user, inverse_of: :comments

  validates :content, presence: true
  validates :user_id, presence: true
  validates :cast_id, presence: true
end
