class CreateCheckouts < ActiveRecord::Migration[7.1]
  def change
    create_table :checkouts do |t|
      t.string :plates
      t.string :restaurant
      t.string :price

      t.timestamps
    end
  end
end
