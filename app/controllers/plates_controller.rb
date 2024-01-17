class PlatesController < ApplicationController
  def index
    @cart = current_user.cart
    @review = Review.new
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
      @plate.photo.attach(params[:plate][:image])
      params[:plate][:category_ids].each do |category_id|
        next if category_id.empty?
        CategoryPlate.create(plate: @plate, category_id: category_id)
      end
      redirect_to my_restaurants_path, notice: "Plate was successfully created."
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
    @plate.category_plates.destroy_all
    @plate.destroy
    redirect_to my_restaurants_path, status: :see_other, notice: 'Plate was successfully deleted.'
  end

    def by_category
      @category = Category.find(params[:category_id])
      @plates = @category.plates
    end

  private

  def plate_params
    params.require(:plate).permit(:name, :description, :cooked_date, :stock, :new_price, :old_price, :photo, :restaurant_id, category_plate_id: [])
  end

end
