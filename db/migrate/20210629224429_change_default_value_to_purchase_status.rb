class ChangeDefaultValueToPurchaseStatus < ActiveRecord::Migration[6.1]
  def change
    change_column :purchases, :status, :integer, default: 0
  end
end
