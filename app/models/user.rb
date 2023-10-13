class User < ApplicationRecord
  has_secure_token
  has_secure_password 

  # SALE
  has_many :user_property_sale
  #para que no cause conflicto con el de abajo
  has_many :properties_sale, through: :user_property_sale, source: :property

  #RENT
  has_many :user_property_rent
  has_many :properties_rent, through: :user_property_rent, source: :property
 
  has_many :property_users
  has_many :properties, through: :property_users

  # Validaciones
  validates :name, presence: true, on: :update, allow_nil: true
  validates :email, uniqueness: true,
                    presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "is invalid" }

  enum role: { home_seeker: 0, owner: 1 }
  validates :role, presence: true

  def invalidate_token
    puts token
    update(token: nil)
  end

  def update_token
    regenerate_token
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    puts user.token
    return false unless user&.authenticate(password)

    user.regenerate_token
    user
  end
end
