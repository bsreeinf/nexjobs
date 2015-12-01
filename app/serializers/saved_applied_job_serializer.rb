class SavedAppliedJobSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :job_id, :job_status_id
  has_one :job_status
end
