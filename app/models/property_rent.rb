class PropertyRent < ApplicationRecord
  belongs_to :property
  has_many :user_property_rents
  has_many :users, through: :user_property_rents
end
