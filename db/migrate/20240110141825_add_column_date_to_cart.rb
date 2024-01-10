class AddColumnDateToCart < ActiveRecord::Migration[7.1]
  def change
    add_column :carts, :date, :date
  end
end
