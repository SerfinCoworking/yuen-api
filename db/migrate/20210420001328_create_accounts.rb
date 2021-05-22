class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.references :user, null: false, index: true
      t.references :account_type, null: false, index: true
      t.references :company, null: false, index: true
      t.string :name
      t.string :account_alias
      t.string :cbu
      t.string :description
      t.decimal :balance, default: 0

      t.timestamps
    end
  end
end
