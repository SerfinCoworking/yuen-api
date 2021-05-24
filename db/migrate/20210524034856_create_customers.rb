class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :address
      t.string :phone
      t.string :cuit
      t.string :email
      t.name :organization
      t.references :company, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
