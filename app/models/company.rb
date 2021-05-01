class Company < ApplicationRecord
  # Relations
  has_many :users

  # Validations
  validates :name, presence: true
end
