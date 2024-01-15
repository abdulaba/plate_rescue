class CheckoutsController < ApplicationController
  def create
    @checkout = Checkout.new
    @cart = Cart.find(params[:cart_id])
    @plates = @cart.plates
    @chekout.plates = @plates
    if @checkout.save
      redirect_to cart_checkouts_path(@cart)
    else
      redirect_to cart_path(@cart), notice: 'We could not complete your order.'
    end
  end

end
