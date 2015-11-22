class Job < ActiveRecord::Base
	belongs_to :company
	has_many :questionnaire
	has_one :industry
	has_one :location
end
