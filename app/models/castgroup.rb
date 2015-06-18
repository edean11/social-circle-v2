class Castgroup < ActiveRecord::Base
  belongs_to :cast, inverse_of: :castgroups
  belongs_to :group, inverse_of: :castgroups
end
