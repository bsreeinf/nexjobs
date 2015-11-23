class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :postal_code, :salary_type, :salary_offered, :contact_person_name, :contact_person_phone, :contact_person_email
  has_one :industry
  has_one :location
  has_one :company
  has_many :questionnaires
end
