class Event < ActiveRecord::Base
  attr_accessible :date, :description, :name, :event_attendances_attributes, :document

  has_many :event_attendances, :dependent => :destroy
	has_many :users, :through => :event_attendances, :dependent => :destroy

	scope :chronological, order('date DESC')

	accepts_nested_attributes_for :event_attendances, :allow_destroy => true

  mount_uploader :document, DocumentUploader

  def take_attendance
  	attendance = EventAttendance.for_event(self.id)
  	present = 0
  	late = 0
  	absent = 0
  	attendance.each do |e|
  		if e.present
  			present += 1
  		else
  			absent += 1
  		end
  		if e.late
  			late += 1
  		end
  	end
		ea = Array.new
		ea << present << late << absent
		ea  
  end

end
