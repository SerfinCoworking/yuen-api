class CreateUnities < ActiveRecord::Migration[6.1]
  def change
    create_table :unities do |t|
      t.integer :unity_type
      t.string :name
      t.string :symbol
      t.decimal :equivalence
      t.string :equivalence_unit

      t.timestamps
    end
  end
end
