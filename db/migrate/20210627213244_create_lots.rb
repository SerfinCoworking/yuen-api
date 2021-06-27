class CreateLots < ActiveRecord::Migration[6.1]
  def change
    create_table :lots do |t|
      t.references :stock, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :provider, null: false, foreign_key: true
      t.decimal :cost_price, default: 0
      t.date :manufacturing_date
      t.date :expiry_date
      t.integer :reserved_quantity, default: 0
      t.integer :available_quantity, default: 0
      t.integer :total_quantity, default: 0

      t.timestamps
    end
  end
end
