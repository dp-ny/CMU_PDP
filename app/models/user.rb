class User < ActiveRecord::Base
  attr_accessible :alumni, :birthday, :role, :class_name, :first_name, :last_name, :password_digest, :pledge_name, :password, :password_confirmation

  has_secure_password
  validates_presence_of :password, :password_confirmation

  has_many :transactions
  has_many :event_attendances
	has_many :events, :through => :event_attendances

	scope :alphabetical, order('last_name, first_name')

  CLASS_LIST = ['Alpha', 'Beta', 'Gamma', 'Delta', 'Eta', 'Zeta', 'Theta', 'Iota', 'Lambda', 'Mu', 'Nu', 'Xi', 'Omicron', 'Pi', 'Rho', 'Sigma', 'Tau', 'Upsilon', 'Phi']
  ROLE_LIST = ['admin', 'user']

  def proper_name
  	"#{self.first_name} #{self.last_name}"
  end

  def take_attendance
  	attendance = EventAttendance.for_user(self.id)
  	present = Array.new
  	late = Array.new
  	absent = Array.new
  	attendance.each do |e|
  		if e.present
  			present << e
  		else
  			absent << e
  		end
  		if e.late
  			late << e
  		end
  	end
		ea = Array.new
		ea << present << late << absent
		ea  
  end
end
