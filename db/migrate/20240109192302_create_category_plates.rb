class CreateCategoryPlates < ActiveRecord::Migration[7.1]
  def change
    create_table :category_plates do |t|
      t.references :category, null: false, foreign_key: true
      t.references :plate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
