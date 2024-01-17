class CheckoutsController < ApplicationController
  def create
    @cart = Cart.find(params[:cart_id])
    @dishes = @cart.plates
    dishes_stock = JSON.parse(params[:ids])
    @checkout = Checkout.new(dish: @dishes)
    @checkout.user_id = current_user.id
    @checkout.restaurant_id = @dishes.first.restaurant_id
    if @checkout.save
      dishes_stock.each do |plate_id, plate_data|
        cantidad = plate_data["quantity"]
        plate_instance = Plate.find(plate_id)
        if plate_instance && cantidad.is_a?(Integer) && cantidad.positive?
          plate_instance.update(stock: plate_instance.stock - cantidad)
        end
      end
      @cart.destroy
      redirect_to checkouts_path
    else
      redirect_to cart_path(@cart), notice: 'We could not complete your order.'
    end
  end

  def index
    @checkouts = Checkout.where(user_id: current_user.id)
    render :index
  end
end
