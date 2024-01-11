class Cart < ApplicationRecord
  belongs_to :user
  has_many :selectedplates
  has_many :plates, through: :selectedplates
  
  def add_product(plate)
    selected_item = selectedplates.find_by(plate_id: plate.id)

    if selected_item
      selected_item.quantity += 1
    else
      selected_item = selectedplates.build(plate_id: plate.id, price: plate.new_price)
    end

    selected_item
  end
end
