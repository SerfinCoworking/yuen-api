class Unity < ApplicationRecord
  enum unity_type: { lenght: 0, area: 1, weight: 2, capacity: 3, volume: 4 }

  # Relationships
  has_many :products

  # Validations
  validates_presence_of :unity_type, :name, :symbol, :equivalence, :equivalence_unit
end
