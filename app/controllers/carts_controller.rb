class CartsController < ApplicationController
  def show
    @cart = Cart.find(current_user.carts.last.id)
    @restaurant = @cart.plates.last.restaurant_id
    @selected_items = @cart.selectedplates.includes(:plate)
  end
end
