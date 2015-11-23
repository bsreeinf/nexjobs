class Questionnaire < ActiveRecord::Base
	belongs_to :jobs
	has_many :questionnaire_options, :dependent => :delete_all
end
