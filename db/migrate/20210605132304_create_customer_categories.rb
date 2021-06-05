class CreateCustomerCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :customer_categories do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
