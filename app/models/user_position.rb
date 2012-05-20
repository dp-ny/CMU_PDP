class UserPosition < ActiveRecord::Base
  attr_accessible :position_id, :user_id

  belongs_to :user
  belongs_to :position
  belongs_to :semester

  scope :for_user, lambda {|user_id| where("user_id = ?", user_id) }
  scope :for_position, lambda {|position_id| where("position_id = ?", position_id) }
  scope :for_semester, lambda {|semester_id| where("semester_id = ?", semester_id) }
  scope :chronological, joins(:semester).order('year DESC')

  def self.find_user(semester, position)
  	semester.user_positions.each do |up|
  		if up.position == position
  			return up.user
  		end
  	end
  end

end
