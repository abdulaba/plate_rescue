class AddOldPriceToPlates < ActiveRecord::Migration[7.1]
  def change
    add_column :plates, :old_price, :float
  end
end
