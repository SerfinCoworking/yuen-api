class CreateAccountTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :account_types do |t|
      t.string :name
      t.references :company, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
