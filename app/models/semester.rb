class Semester < ActiveRecord::Base
  attr_accessible :semester, :year, :user_positions_attributes

  has_many :user_positions, :dependent => :destroy
  has_many :users, :through => :user_positions, :dependent => :destroy
  has_many :positions, :through => :user_positions, :dependent => :destroy

  scope :chronological, order('year DESC')

  accepts_nested_attributes_for :user_positions, :allow_destroy => true, :reject_if => lambda {|up| up[:user_id].blank?}

  SEMESTER_LIST = %w[Spring Fall]

  def self.current_semester 
  	now = Time.now.month
  	if now >= 1 && now < 5
  		return 'Spring'
  	end
    return 'Fall'
  end

 	def name
 		"#{self.semester} #{self.year.strftime('%Y')}"
	end  

end
