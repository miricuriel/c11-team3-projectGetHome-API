class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone, :role_id, :token 
end
