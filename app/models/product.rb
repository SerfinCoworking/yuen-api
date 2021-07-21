class Product < ApplicationRecord
  include PgSearch::Model
  include CompanyScope

  # Relationships
  belongs_to :company
  belongs_to :category, class_name: 'ProductCategory'
  belongs_to :unity
  has_many :purchase_products
  has_many :purchases, through: :purchase_products

  # Validations
  validates_presence_of :name, :company_id, :category_id, :unity_id, :quantity_per_unit

  validates :quantity_per_unit, numericality: { only_integer: true, greater_than: 2 }

  pg_search_scope :search_name,
                  against: [:name],
                  using: {
                    tsearch: { prefix: true },
                    trigram: {}
                  }, # Buscar coincidencia en cualquier parte del string
                  ignoring: :accents # Ignorar tildes.
end
