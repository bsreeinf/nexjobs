class UserQualification < ActiveRecord::Base
  belongs_to :user
  belongs_to :qualification
end
