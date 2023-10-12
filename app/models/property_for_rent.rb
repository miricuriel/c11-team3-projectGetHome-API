class PropertyForRent < ApplicationRecord
  belongs_to :properties
  belongs_to :user_property_rent
end
