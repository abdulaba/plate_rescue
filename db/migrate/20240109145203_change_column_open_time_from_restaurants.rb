class ChangeColumnOpenTimeFromRestaurants < ActiveRecord::Migration[7.1]
  def change
    change_column :restaurants, :opening_time, :string
  end
end
