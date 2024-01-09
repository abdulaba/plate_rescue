class RemoveCategoriesFromPlates < ActiveRecord::Migration[6.0]
  def change
    remove_column :plates, :categories
  end
end
