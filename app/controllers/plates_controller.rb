class PlatesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    #@plates = @restaurant.plates
    @categories = Category.all

  end

  def show
    #@restaurant = Restaurant.find(params[:restaurant_id])
    @plate = Plate.find(params[:id])
  end

  def new
    @categories = Category.all
    @restaurant = Restaurant.find(params[:restaurant_id])
    @plate = Plate.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @plate = Plate.new(plate_params)
    @plate.restaurant_id = @restaurant.id
    if @plate.save
      redirect_to my_restaurants_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    #@restaurant = Restaurant.find(params[:restaurant_id])
    @plate = Plate.find(params[:id])
    @categories = Category.all
  end

  def update
    #@restaurant = Restaurant.find(params[:restaurant_id])
    @plate = Plate.find(params[:id])
    #@plate.restaurant_id = @restaurant.id
    if @plate.update(plate_params)
      redirect_to my_restaurants_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    #@restaurant = Restaurant.find(params[:restaurant_id])
    @plate = Plate.find(params[:id])
    @plate.destroy
    redirect_to my_restaurants_path, status: :see_other, notice: 'Plate was successfully deleted.'
  end

    def by_category
      @category = Category.find(params[:category_id])
      @plates = @category.plates
    end

  private

  def plate_params
    params.require(:plate).permit(:name, :description, :cooked_date, :stock, :new_price, :old_price, :photo,  category_plate_ids:[])
  end

end
