class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email
  has_many :user_skills
  has_many :user_languages
end
