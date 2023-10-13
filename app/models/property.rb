class Property < ApplicationRecord
  has_one :user_property_sale
  has_one :user_sale, through: :user_property_sale, source: :user

  has_one :user_property_rent
  has_one :user_rent, through: :user_property_rent, source: :user

  # Validaciones
  # validates :photos, presence: true
  validates :address, presence: true
  validates :operation_type, inclusion: { in: ["sale", "rent"] }
  validates_uniqueness_of :user_property_sale, allow_nil: true

  enum property_type: {"house": 0, "apartment": 1}
end