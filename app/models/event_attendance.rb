class EventAttendance < ActiveRecord::Base
  attr_accessible :absent, :event_id, :late, :present, :user_id

  belongs_to :event
  belongs_to :user

  scope :for_event, lambda {|event_id| where("event_id = ?", event_id) }
  scope :for_user, lambda {|user_id| where("user_id = ?", user_id) }
  scope :late, where("late = ?", true)
  scope :present, where("present = ?", true)
  scope :absent, where("present = ?", false) 

end
