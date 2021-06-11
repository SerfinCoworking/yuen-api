class AddAttributesToPurchases < ActiveRecord::Migration[6.1]
  def change
    add_column :purchases, :reference_number, :string
    add_column :purchases, :date, :date
    add_column :purchases, :price_list_updated_date, :datetime
    add_reference :purchases, :price_list, null: false, foreign_key: true, index: true
  end
end
