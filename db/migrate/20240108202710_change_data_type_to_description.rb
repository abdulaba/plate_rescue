class ChangeDataTypeToDescription < ActiveRecord::Migration[7.1]
  def change
    change_column :plates, :description, :text
  end
end
