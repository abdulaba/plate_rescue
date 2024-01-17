class AddRestaurantToCheckouts < ActiveRecord::Migration[7.1]
  def change
    add_reference :checkouts, :restaurant, foreign_key: true
  end
end
