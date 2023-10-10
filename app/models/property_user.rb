class PropertyUser < ApplicationRecord
  belongs_to :user
  belongs_to :property

  # Validaciones
  validates :favorite, inclusion: { in: [false, true] }
  validates :contacted, inclusion: { in: [false, true] }
end
