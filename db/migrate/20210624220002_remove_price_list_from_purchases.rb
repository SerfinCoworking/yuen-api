class RemovePriceListFromPurchases < ActiveRecord::Migration[6.1]
  def change
    remove_reference :purchases, :price_list, null: false, foreign_key: true
  end
end
