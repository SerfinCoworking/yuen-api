class CreatePurchaseProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_products do |t|
      t.references :purchase, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.integer :presentation

      t.timestamps
    end
  end
end