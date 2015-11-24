class JobStatus < ActiveRecord::Base
	has_many :saved_applied_jobs 

	def to_s
	  description
	end
end
