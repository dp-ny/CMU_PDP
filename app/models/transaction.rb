class Transaction < ActiveRecord::Base
  attr_accessible :amount, :date, :description, :user_id

  belongs_to :user

  validates_date :date
  validates_numericality_of :amount
end
