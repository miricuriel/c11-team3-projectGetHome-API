class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :phone, :role, :token 
end
