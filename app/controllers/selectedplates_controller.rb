class SelectedplatesController < ApplicationController
  before_action :set_cart, only: :create # @cart => una instancia de Cart

  def create
    plate = Plate.find(params[:plate_id])
    @selected_item = Selectedplate.new
    @cart = 0
    if current_user.carts.empty?
      @cart = Cart.create(user: current_user)
    else
      @cart = current_user.carts.last
    end
    @selected_item.cart_id = @cart.id
    @selected_item.plate_id = plate.id
    @selected_item.price = plate.new_price
    respond_to do |format|
      if @selected_item.save
        format.html { redirect_to cart_path(@cart.id) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @selected_item = Selectedplate.find(params[:id])
    @selected_item.destroy
    redirect_to cart_path, notice: 'Item removed from cart successfully.'
  end
end
