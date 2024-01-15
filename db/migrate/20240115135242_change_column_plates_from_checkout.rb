class ChangeColumnPlatesFromCheckout < ActiveRecord::Migration[7.1]
  def change
    rename_column :checkouts, :plates, :dishes
  end
end
