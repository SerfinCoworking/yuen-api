class AddCategoryToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_reference :customers, :category, index: true, foreign_key: { to_table: :customer_categories }
  end
end
