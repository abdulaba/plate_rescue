class AddPriceToSelectedplate < ActiveRecord::Migration[7.1]
  def change
    add_column :selectedplates, :price, :float
  end
end
