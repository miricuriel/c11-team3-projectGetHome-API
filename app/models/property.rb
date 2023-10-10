class Property < ApplicationRecord
  belongs_to :property_type
  has_one :property_sale
  has_one :property_rent
  has_many :property_users
  has_many :users, through: :property_users
end
