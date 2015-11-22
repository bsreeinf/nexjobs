class Questionnaire < ActiveRecord::Base
	belongs_to :job
	has_many :questionnaire_options
end
