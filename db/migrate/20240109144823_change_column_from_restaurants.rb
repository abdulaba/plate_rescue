class ChangeColumnFromRestaurants < ActiveRecord::Migration[7.1]
  def change
    change_column :restaurants, :opening_date, :string
  end
end
