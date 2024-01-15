class ChangeColumnDishesFromCheckout < ActiveRecord::Migration[7.1]
  def change
    rename_column :checkouts, :dishes, :dish
  end
end
