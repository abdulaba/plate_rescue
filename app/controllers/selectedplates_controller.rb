class SelectedplatesController < ApplicationController
  before_action :set_cart, only: :create # @cart => una instancia de Cart

  def create
    plate = Plate.find(params[:plate_id])
    @selected_item = Selectedplate.new
    @cart = current_user.cart || Cart.create(user: current_user)

    @selected_item.cart_id = @cart.id
    @selected_item.plate_id = plate.id
    @selected_item.price = plate.new_price
    if plate.stock > Selectedplate.where(plate_id: plate.id, cart_id: @cart.id).count
      respond_to do |format|
      if @selected_item.save
        format.html { redirect_to cart_path(@cart.id) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
     end
      else
        redirect_to cart_path(@cart.id), notice: 'The restaurant does not have enough stock to add that item to your cart'
    end
  end


  def destroy
    @selected_item = Selectedplate.find(params[:id])
    @selected_item.destroy
    redirect_to cart_path, notice: 'Item removed from cart successfully.'
  end
end
