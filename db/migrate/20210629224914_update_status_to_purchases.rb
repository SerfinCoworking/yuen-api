class UpdateStatusToPurchases < ActiveRecord::Migration[6.1]
  def change
    Purchase.find_each do | purchase |
      purchase.in_progress!
    end
  end
end
