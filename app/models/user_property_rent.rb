class UserPropertyRent < ApplicationRecord
  belongs_to :user
  belongs_to :property_rent
end