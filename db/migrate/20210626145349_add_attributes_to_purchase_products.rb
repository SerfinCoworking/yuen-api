class AddAttributesToPurchaseProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :purchase_products, :expiry_date, :date
    add_column :purchase_products, :cost_price, :decimal, default: 0
    add_column :purchase_products, :total_line, :decimal, default: 0
  end
end
