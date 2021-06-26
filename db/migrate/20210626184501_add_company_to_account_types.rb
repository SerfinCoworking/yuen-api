class AddCompanyToAccountTypes < ActiveRecord::Migration[6.1]
  def change
    add_reference :account_types, :company, foreign_key: true, index: true, null: true
  end
end
