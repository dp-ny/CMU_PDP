class Transaction < ActiveRecord::Base
  attr_accessible :amount, :date, :description, :user_id

  belongs_to :user

  scope :for_user, lambda {|user_id| where("user_id = ?", user_id) }

  validates_date :date
  validates_numericality_of :amount
end
