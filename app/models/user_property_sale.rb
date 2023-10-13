class UserPropertySale < ApplicationRecord
  belongs_to :user
  has_many :properties
end
