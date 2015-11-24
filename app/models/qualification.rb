class Qualification < ActiveRecord::Base
  has_many :user_qualifications
  has_many :users, through: :user_qualifications

  def to_s
	  description
	end
end
