class UserPosition < ActiveRecord::Base
  attr_accessible :position_id, :semester, :user_id, :year

  belongs_to :user
  belongs_to :position

  SEMESTER_LIST = %w[Spring Fall]
end
