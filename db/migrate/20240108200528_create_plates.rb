class CreatePlates < ActiveRecord::Migration[7.1]
  def change
    create_table :plates do |t|
      t.integer :stock
      t.string :categories
      t.float :price
      t.string :description
      t.string :name
      t.date :cooked_date
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
