class RestaurantsController < ApplicationController

  # before_action

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurants_params)
    if @restaurant.save
      redirect_to restaurants_path, notice: "Restaurant created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    # @restaurant.user_id == current_user.id
    if @restaurant.update(restaurants_params)
      redirect_to restaurant_path(@restaurant.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, notice: 'Restaurant was successfully destroyed.'
  end

  private

  def restaurants_params
    params.require(:restaurant).permit(:name, :address, :opening_date, :opening_time)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.nil?
      redirect_to root_path, notice: "Restaurant not found"
    end
  end
end
