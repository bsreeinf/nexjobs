class Questionnaire < ActiveRecord::Base
	belongs_to :job
	has_many :questionnaire_options, :dependent => :delete_all
end
