class Property < ApplicationRecord
  belongs_to :property_type
  has_one :property_for_sale
  has_one :property_for_rent
end
