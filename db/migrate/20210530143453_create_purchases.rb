class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.references :provider, null: false, foreign_key: true, index: true
      t.references :company, null: false, foreign_key: true, index: true
      t.integer :status
      t.decimal :total_price

      t.timestamps
    end
  end
end
