class CheckoutsController < ApplicationController
  def create
    @cart = Cart.find(params[:cart_id])
    @dishes = @cart.plates
    @checkout = Checkout.new(dish: @dishes)

    if @checkout.save
      @cart.destroy
      redirect_to cart_checkouts_path(@cart)
    else
      redirect_to cart_path(@cart), notice: 'We could not complete your order.'
    end
  end


  def index
    @cart = current_user.cart || Cart.create(user: current_user)
    @checkouts = Checkout.all
    render :index
  end
end
