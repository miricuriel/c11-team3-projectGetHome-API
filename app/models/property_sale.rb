class PropertySale < ApplicationRecord
  belongs_to :property
  has_many :user_property_sales
  has_many :users, through: :user_property_sales

  # Validaciones
  validates :price, presence: true
end
