class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email, :address
end
