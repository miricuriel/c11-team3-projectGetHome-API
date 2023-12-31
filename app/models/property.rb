class Property < ApplicationRecord
  serialize :photo_url, Array
  
  has_one :user_property_sale, dependent: :destroy
  has_one :user_sale, through: :user_property_sale, source: :user

  has_one :user_property_rent, dependent: :destroy
  has_one :user_rent, through: :user_property_rent, source: :user

  has_many :property_users, dependent: :destroy
  has_many :users, through: :property_users

  # Validaciones
  # validates :photos, presence: true
  validates :address, presence: true, allow_nil: true
  validates :operation_type, inclusion: { in: ["sale", "rent"] }


  enum property_type: {"house": 0, "apartment": 1}
end
