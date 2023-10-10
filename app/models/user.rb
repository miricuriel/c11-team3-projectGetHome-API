class User < ApplicationRecord
  has_secure_password 
  has_secure_token

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

  def invalidate_token
    update(token: nil)
  end

  def self.authenticate(email, password)
    user = User.find_by(email:)
    return false unless user&.authenticate(password)

    user.regenerate_token
    user
  end
end
