class Customer < ApplicationRecord
  # Relationships
  belongs_to :company

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
