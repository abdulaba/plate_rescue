class RemoveRestaurantsFromCheckouts < ActiveRecord::Migration[7.1]
  def change
    remove_column :checkouts, :restaurant, :string
  end
end
