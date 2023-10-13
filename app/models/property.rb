class Property < ApplicationRecord

  # Validaciones
  # validates :photos, presence: true
  validates :address, presence: true
  validates :operation_type, inclusion: { in: ["sale", "rent"] }
  enum property_type: {"house": 0, "apartment": 1}
end
