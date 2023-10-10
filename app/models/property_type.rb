class PropertyType < ApplicationRecord
  has_many :properties
  validates :name, presence: true, inclusion: { in: ["house", "apartment"] }
end