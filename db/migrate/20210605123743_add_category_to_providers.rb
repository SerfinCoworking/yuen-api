class AddCategoryToProviders < ActiveRecord::Migration[6.1]
  def change
    add_reference :providers, :category, index: true
  end
end
