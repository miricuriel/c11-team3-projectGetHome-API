class PropertySale < ApplicationRecord
  belongs_to :property
  # belongs_to :user_property_sale
  has_many :user_property_sales
  has_many :users, through: :user_property_sales
end
