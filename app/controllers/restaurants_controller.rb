class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {restaurant: restaurant}),
        marker_html: render_to_string(partial: "marker", locals: {restaurant: restaurant})
      }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id

    if @restaurant.save
      redirect_to my_restaurants_path(@restaurant), notice: 'Restaurant was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to my_restaurants_path, notice: 'Restaurant was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.plates.destroy_all
    @restaurant.destroy
    redirect_to my_restaurants_path, notice: 'Restaurant was successfully destroyed.', status: :see_other
  end

  def my_restaurants
    @restaurants = Restaurant.where(user_id: current_user.id)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :opening_date, :opening_time, :photo)
  end

end
