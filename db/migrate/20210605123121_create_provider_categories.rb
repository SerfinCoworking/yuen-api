class CreateProviderCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :provider_categories do |t|
      t.references :company, foreign_key: true, index: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
