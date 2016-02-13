class Job < ActiveRecord::Base
	belongs_to :company
	has_many :questionnaires
	belongs_to :industry
	belongs_to :location
	belongs_to :job_type
end
