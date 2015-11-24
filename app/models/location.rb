class Location < ActiveRecord::Base
	has_many :jobs

	def to_s
	  description
	end
end
