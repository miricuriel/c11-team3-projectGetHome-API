class PropertyUserSerializer < ActiveModel::Serializer
  attributes :id, :property_id, :favorite, :contacted
end
