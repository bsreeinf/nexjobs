class Job < ActiveRecord::Base
	belongs_to :company
	has_many :questionnaires
	belongs_to :industry
	belongs_to :location
end
