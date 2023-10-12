class PropertyForSale < ApplicationRecord
  belongs_to :properties
  belongs_to :user_property_sale
end
