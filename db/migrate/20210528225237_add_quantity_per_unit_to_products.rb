class AddQuantityPerUnitToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :quantity_per_unit, :decimal
  end
end
