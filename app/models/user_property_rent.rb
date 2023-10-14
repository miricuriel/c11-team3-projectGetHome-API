class UserPropertyRent < ApplicationRecord
  belongs_to :user
  belongs_to :property
  
  # Validaciones
  validates_uniqueness_of :property_id
end
