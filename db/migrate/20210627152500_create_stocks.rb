class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.references :product, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.integer :available_quantity, default: 0
      t.integer :reserved_quantity, default: 0
      t.integer :total_quantity, default: 0

      t.timestamps
    end
  end
end
