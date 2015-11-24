class SavedAppliedJob < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  belongs_to :job_status
end
