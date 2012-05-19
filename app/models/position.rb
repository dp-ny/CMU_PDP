class Position < ActiveRecord::Base
  attr_accessible :name

  has_many :user_positions, :dependent => :destroy
  has_many :users, :through => :user_positions, :dependent => :destroy
end
