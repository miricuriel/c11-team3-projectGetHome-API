class User < ApplicationRecord
  has_secure_token
  has_secure_password 

  belongs_to :role
  has_many :property_users
  has_many :properties, through: :property_users
  has_many :user_property_sales
  has_many :property_sale, through: :user_property_sales
  has_many :user_property_rents
  has_many :property_rent, through: :user_property_rents

  # Validaciones
  validates :name, presence: true, on: :update, allow_nil: true
  validates :email, uniqueness: true,
                    presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "is invalid" }

  def as_json(options = {})
    super(options.merge(except: [:password_digest]))
  end

  def invalidate_token
    puts token
    update(token: nil)
  end

  def update_token
    regenerate_token
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return false unless user&.authenticate(password)

    user.regenerate_token
    user
  end
end
