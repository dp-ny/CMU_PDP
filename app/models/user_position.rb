class UserPosition < ActiveRecord::Base
  attr_accessible :position_id, :semester, :user_id, :year

  belongs_to :user
  belongs_to :position

  scope :for_user, lambda {|user_id| where("user_id = ?", user_id) }
  scope :chronological, order('year DESC')

  SEMESTER_LIST = %w[Spring Fall]
end
