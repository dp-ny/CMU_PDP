namespace :db do

  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Need two gems to make this work: faker & populator
    # Docs at: http://populator.rubyforge.org/
    require 'populator'
    
    # Step 0: clear any old data in the db
    [User, Transaction, Event, EventAttendance].each(&:delete_all)
    
    
  end
end      
