class RenameColumnDateToRequestDateFromPurchases < ActiveRecord::Migration[6.1]
  def change
    rename_column :purchases, :date, :request_date
  end
end
