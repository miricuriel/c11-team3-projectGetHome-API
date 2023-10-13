class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone, :role, :token 
end
