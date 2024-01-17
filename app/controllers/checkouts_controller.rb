class CheckoutsController < ApplicationController
  def create
    @cart = Cart.find(params[:cart_id])
    @dishes = @cart.plates
    @checkout = Checkout.new(dish: @dishes)
    @checkout.user_id = current_user.id
    @checkout.restaurant_id = @dishes.first.restaurant_id
    if @checkout.save
      @dishes.each do |dish|
        dish.stock = dish.stock - 1
        dish.save
      end
      @cart.destroy
      redirect_to checkouts_path
    else
      redirect_to cart_path(@cart), notice: 'We could not complete your order.'
    end
  end

  def index
    @cart = current_user&.cart
    @checkouts = Checkout.where(user_id: current_user.id)
    render :index
  end
end
