class UserPropertySale < ApplicationRecord
  belongs_to :user
  # has_and_belong_to_many :property_sales
  belongs_to :property_sale
end
