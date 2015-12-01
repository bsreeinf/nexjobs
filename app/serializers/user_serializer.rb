class UserSerializer < ActiveModel::Serializer
  attributes :id, :qualification_id, :name, :phone, :email
  has_many :user_skills
  has_many :user_languages
  has_many :saved_applied_jobs
end
