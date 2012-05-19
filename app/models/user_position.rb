class UserPosition < ActiveRecord::Base
  attr_accessible :position_id, :semester, :user_id, :year

  belongs_to :user
  belongs_to :position

  scope :for_user, lambda {|user_id| where("user_id = ?", user_id) }
  scope :chronological, order('year DESC')

  SEMESTER_LIST = %w[Spring Fall]

  def self.current_semester 
  	now = Time.now.month
  	if now >= 1 && now <= 5
  		return 'Spring'
  	return 'Fall'
  end
  
end
