class CreateSelectedplates < ActiveRecord::Migration[7.1]
  def change
    create_table :selectedplates do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :plate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
