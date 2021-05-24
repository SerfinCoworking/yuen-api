class Provider < ApplicationRecord
  # Relationships
  belongs_to :company

  # Validations
  validates :name, presence: true
  validates :email, presence: true
  valiadtes :company, presence: true
end
