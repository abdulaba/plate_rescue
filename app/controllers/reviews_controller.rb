class ReviewsController < ApplicationController

  def index
    @restaurants = Restaurant.includes(:reviews).all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to restaurants_path, notice: 'Review was successfully created.'
    else
      flash[:alert] = "Something went wrong."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
