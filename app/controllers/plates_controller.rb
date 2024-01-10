class PlatesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @plate = Plate.new
  end

  def create
  @restaurant = Restaurant.find(params[:restaurant_id])
    @plate = Plate.new(plate_params)
    @plate.restaurant_id = @restaurant.id
    if @plate.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def dish_params
    params.require(:dish).permit(:name, :description, :price, :photo)
  end
end
