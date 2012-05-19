class UserPosition < ActiveRecord::Base
  attr_accessible :position_id, :semester, :user_id, :year

  belongs_to :user
  belongs_to :position
end
