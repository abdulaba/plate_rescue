class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.time :opening_time
      t.date :opening_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
