class User < ApplicationRecord
  belongs_to :role
  has_many :property_users
  has_many :properties, through: :property_users
  has_many :user_property_sales
  has_many :property_sale, through: :user_property_sales
  has_many :user_property_rents
  has_many :property_rent, through: :user_property_rents

  # Validaciones
  validates :name, presence: true
  validates :email, uniqueness: true,
                    presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "is invalid" }
  
end
