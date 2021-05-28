class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone
      t.string :cuit
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
