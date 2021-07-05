class AddWebPageToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :web_page, :string
  end
end
