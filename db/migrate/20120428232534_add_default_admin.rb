class AddDefaultAdmin < ActiveRecord::Migration
  def up
  	admin = User.new
  	admin.first_name = "Yihuan"
  	admin.last_name = "Zhou"
  	admin.class_name = "Tau"
  	admin.pledge_name = "Stark"
  	admin.birthday = Date.new(1992, 8, 29)
    admin.phone = "5103863939"
  	admin.password = "1234"
  	admin.password_confirmation = "1234"
    admin.role = "admin"
    admin.alumni = false
  	admin.save!
  end

  def down
  end
end
