class CartsController < ApplicationController
  def show
    @cart = Cart.find(current_user.carts.last.id)
    @restaurant = @cart.plates.last.restaurant_id
    @selected_items = @cart.selectedplates.includes(:plate)
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.status = 'payed'
    @cart.date = Date.today
    @cart.save
    Cart.create(user: current_user)
    redirect_to carts_path
  end

  def index
    @carts = current_user.carts
  end
end
