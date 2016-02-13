class JobSerializer < ActiveModel::Serializer
  attributes :id, :company_id, :industry_id, :location_id, :job_type_id, :title, :job_description, :postal_code, :salary_type, :salary_offered, :contact_person_name, :contact_person_phone, :contact_person_email, :created_at
  # has_one :industry
  # has_one :location
  # has_one :company
  has_many :questionnaires
end
