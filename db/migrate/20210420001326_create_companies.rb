class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone
      t.string :logo
      t.string :web_page

      t.timestamps
    end
  end
end
