class Property < ApplicationRecord
  has_one :user_property_sale
  has_one :user, through: :user_property_sale

  # Validaciones
  # validates :photos, presence: true
  validates :address, presence: true
  validates :operation_type, inclusion: { in: ["sale", "rent"] }
  validates_uniqueness_of :user_property_sale, allow_nil: true

  enum property_type: {"house": 0, "apartment": 1}
end
