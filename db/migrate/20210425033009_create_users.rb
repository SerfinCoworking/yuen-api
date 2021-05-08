class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.boolean :email_verified
      t.string :email
      t.string :auth0_id
      t.string :username
      t.string :phone_number
      t.boolean :phone_verified
      t.string :picture
      t.string :name
      t.string :nickname
      t.boolean :blocked
      t.string :given_name
      t.string :family_name

      t.timestamps
    end

    add_index :users, :auth0_id, unique: true
  end
end
