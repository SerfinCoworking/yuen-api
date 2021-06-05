class AddCategoryToProviders < ActiveRecord::Migration[6.1]
  def change
    add_reference :providers, :category, null: false, foreign_key: { to_table: :provider_categories }
  end
end
