class CreatePriceLists < ActiveRecord::Migration[6.1]
  def change
    create_table :price_lists do |t|
      t.string :name
      t.references :company, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end