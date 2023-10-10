class UserPropertySale < ApplicationRecord
  belongs_to :user
  belongs_to :property_sale
end
