namespace :seed do


	desc "Seed the database with current user and position information"
  task :positions => :environment do
  	require 'populator'
    require 'spreadsheet'

  	print "Seeding database..."
  	if ENV['sheet'].nil?
  		puts "error, sheet cannot be nil"
  		return
  	end
  	book = Spreadsheet.open 'lib/assets/brothers.xls'
  	positions = book.worksheet ENV['sheet']

    positions.each do |row|
      if !row[0].blank?
      	position = Position.find_by_name(row[0])
      	if position.nil?
	        position = Position.new
	        position.name = row[0]
	        position.save!
	        p "saved #{position.name}"
	      end
        i = 1
        while !row[i].nil?
          p "#{row[i]}"
          up = UserPosition.new
          up.position_id = position.id
          up.user_id = User.find_by_full_name(row[i].to_s).id
          s = Semester.new
          s.year = Time.now
          s.semester = Semester.current_semester
          s.save!
          up.semester_id = s.id
          i += 1
          up.save!
        end 
				        
      end
    end

  end

 end