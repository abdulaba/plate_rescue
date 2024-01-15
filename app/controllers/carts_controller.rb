class CartsController < ApplicationController
  def show
    @cart = current_user.cart
    @checkout = Checkout.new

    if @cart.nil?
      redirect_to restaurants_path, notice: 'Your cart is empty.'
    else
      if @cart.plates.any?
        @restaurant = @cart.plates.last.restaurant
        @selected_items = @cart.selectedplates.includes(:plate)
      else
        redirect_to restaurants_path, notice: 'Your cart is empty.'
      end
    end
  end
end
