class RenamePriceToNewPrice < ActiveRecord::Migration[7.1]
  def change
    rename_column :plates, :price, :new_price
  end
end
