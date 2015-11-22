class User < ActiveRecord::Base
  has_many :user_skills
  has_many :skills, through: :user_skills

  has_many :user_languages
  has_many :languages, through: :user_languages

  has_many :user_qualifications
  has_many :qualifications, through: :user_qualifications

  has_many :saved_applied_jobs
  has_many :jobs, through: :saved_applied_jobs
end
