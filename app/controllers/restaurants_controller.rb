class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @cart = current_user.cart
    @restaurants = Restaurant.all
    @categories = Category.all.order(:name)
    category_id = params[:category_id]

    @city = params[:city]
    @restaurants = Restaurant.all
    if params[:city].present?
      #@restaurants = Restaurant.includes(:plates).where(plates: { id: Plate.select{|plate| plate.name.downcase.include?(params[:food].downcase)}.pluck(:id) }).select{|restaurant|restaurant.address.downcase.include?(params[:city].downcase)}# de este array de platos solo quiero los ID
      @restaurants = Restaurant.all.select{|restaurant| restaurant.address.downcase.include?(params[:city].downcase)}
    end

    if params[:food].present?
      if @categories.pluck(:name).include?(params[:food].capitalize)
        @restaurants = Restaurant.joins(plates: :categories).where(categories: { name: params[:food].capitalize}).distinct
      else
      @restaurants = Restaurant.joins(:plates).where("plates.name ILIKE ?", "%#{params[:food]}%").distinct

      end
    end
    #elsif params[:city].present? # "pizza"
      #@restaurants = Restaurant.select{|restaurant|restaurant.address.downcase.include?(params[:city].downcase)}# de este array de platos solo quiero los ID
    #else
      #@markers = @restaurants.geocoded.map do |restaurant|
       # {
        #  lat: restaurant.latitude,
         # lng: restaurant.longitude,
          #info_window_html: render_to_string(partial: "info_window", locals: {restaurant: restaurant}),
          #marker_html: render_to_string(partial: "marker", locals: {restaurant: restaurant})
        #}
      #end
    if category_id
      @restaurants = Restaurant.joins(plates: [:categories]).where(categories: {id: category_id}).distinct
    end
  end
  def show
    @cart = current_user&.cart
    @restaurant = Restaurant.find(params[:id])
    @checkouts = Checkout.where(restaurant_id: params[:id])
    @total_earned = 0
  @checkouts.each do |checkout|
    total_cost = 0
    checkout.dish.each do |dish|
      total_cost += dish["new_price"].to_f
    end
    @total_earned += total_cost
  end
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
    @restaurant.plates.each do |plate|
      plate.category_plates.destroy_all
    end
    @restaurant.destroy
    redirect_to my_restaurants_path, notice: 'Restaurant was successfully destroyed.', status: :see_other
  end

  def my_restaurants
    @cart = current_user&.cart
    @restaurants = Restaurant.where(user_id: current_user.id)
    @total_earned = 0

    @checkouts = Checkout.where(restaurant_id: @restaurants.pluck(:id))

    @restaurants.each do |restaurant|
      restaurant_checkouts = @checkouts.where(restaurant_id: restaurant.id)

      restaurant_checkouts.each do |checkout|
        total_cost = 0

        checkout.dish.each do |dish|
          quantity = dish["quantity"].to_i
          total_cost += quantity * dish["new_price"].to_f
        end

        @total_earned += total_cost
      end
    end
  end



  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :opening_date, :opening_time, :photo)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
