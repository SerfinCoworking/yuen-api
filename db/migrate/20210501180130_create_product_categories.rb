class CreateProductCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :product_categories do |t|
      t.references :parent, index: true
      t.references :company_id, index: true, null: false
      t.string :name

      t.timestamps
    end
  end
end
