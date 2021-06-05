class AddWebpageToProviders < ActiveRecord::Migration[6.1]
  def change
    add_column :providers, :webpage, :string
  end
end
