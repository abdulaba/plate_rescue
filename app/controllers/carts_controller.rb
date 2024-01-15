class CartsController < ApplicationController
  def show
    @cart = Cart.find(current_user.carts.last.id)
    @checkout = Checkout.new 
    if @cart.plates.any?
      @restaurant = @cart.plates.last.restaurant
      @selected_items = @cart.selectedplates.includes(:plate)
    else
      redirect_to restaurants_path, notice: 'Your cart is empty.'
    end
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.status = 'payed'
    @cart.date = Date.today
    @cart.save
    redirect_to carts_path
  end

  def index
    @carts = current_user.carts
    @restaurants = []

    @carts.each do |cart|
      last_plate = cart.plates.last
      @restaurants << last_plate.restaurant_id if last_plate
    end
  end
end
