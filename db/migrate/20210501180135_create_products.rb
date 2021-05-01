class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :barcode
      t.string :name
      t.text :description
      t.references :company, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
