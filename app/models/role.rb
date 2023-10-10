class Role < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :name, presence: true, inclusion: { in: ["home seeker", "owner"] }
end